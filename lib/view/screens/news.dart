// @dart=2.9
import 'package:flutter/material.dart';
import '../utils/navigation_bar.dart';
import '../../logic/models/News.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

class NewsScreen extends StatefulWidget {
  final String city;
  final int cityIndex;

  const NewsScreen({Key key, @required this.city, @required this.cityIndex})
      : super(key: key);
  @override
  _NewsScreen createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsScreen> {
  RssFeed _rssFeed;

  List<Article> _mediumArticles = [];

  var url = Uri.parse("https://vnexpress.net/rss/tin-moi-nhat.rss");

  Future<RssFeed> getMediumRSSFeedData() async {
    try {
      final client = http.Client();
      final response = await client.get(url);
      return RssFeed.parse(utf8.decode(response.bodyBytes));
    } catch (e) {
      print(e);
    }
    return null;
  }

  updateFeed(feed) {
    setState(() {
      _rssFeed = feed;
    });
  }

  Future<void> launchArticle(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return;
    }
  }

  String preProcessingDes(String s) {
    int pos = s.indexOf('</a>');
    String temp = s.substring(pos + 9, s.length);
    return temp;
  }

  String preProcessingImg(String s) {
    int p1 = s.indexOf('src="');
    int p2 = s.indexOf('" ></a>');
    String temp = s.substring(p1 + 5, p2);
    return temp;
  }

  String preProcessingTime(String s) {
    int pos = s.indexOf(',');
    String temp = s.substring(pos + 1, s.length);
    return temp;
  }

  @override
  void initState() {
    super.initState();
    // Clear old data in the list
    _mediumArticles.clear();

    getMediumRSSFeedData().then((feed) {
      // Update the _feed variable
      updateFeed(feed);
      // Get the data for each item in the feed
      /// Get the title of each item
      int i = 10;
      for (RssItem rssItem in feed.items) {
        // Only print the titles of the articles: comments do not have a description (subtitle), but articles do
        if (i > 0) {
          if (rssItem.description != null) {
            i -= 1;
            print('Title: ${rssItem.title}');
            //print('Link: ${rssItem.link}');
            print('Description: ${preProcessingDes(rssItem.description)}');
            print('Img: ${preProcessingImg(rssItem.description)}');
            print('Time: ${preProcessingTime(rssItem.pubDate.toString())}');

            // Create a new Medium article from the rssitem
            Article mediumArticle = Article(
                title: rssItem.title,
                link: rssItem.link,
                description: preProcessingDes(rssItem.description),
                img: preProcessingImg(rssItem.description),
                time: preProcessingTime(rssItem.pubDate.toString()));

            // Add the article to the list
            _mediumArticles.add(mediumArticle);
          }
        } else
          break;
      }

      // Check to see if list has been populated
      for (Article article in _mediumArticles) {
        print('List contains: ${article.title}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.city),
        ),
        bottomNavigationBar:
            BottomNavigation(city: widget.city, cityIndex: widget.cityIndex),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/doodle.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                Center(
                    child: Text(
                  "TIN TỨC",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF1A535C)),
                )),
                Container(
                    padding: EdgeInsets.only(top: 0),
                    child: Image.asset(
                      "assets/images/plane.png",
                      width: 65,
                      height: 65,
                    )),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 40,
                  child: Image.asset("assets/images/Logo_VnExpress.png",
                      width: 130, height: 25),
                )
              ],
            ),
            for (int index = 0; index < _mediumArticles.length; index++)
              Card(
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(_mediumArticles[index].img,
                                width: 120, height: 96, fit: BoxFit.cover),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      child: Flexible(
                                        child: Container(
                                          child: Expanded(
                                            child: Text(
                                              _mediumArticles[index]
                                                  .description,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 4,
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 20),
                                        ),
                                      ),
                                      onTap: () => launchArticle(
                                          _mediumArticles[index].link),
                                    )
                                  ]),
                            )
                          ]))),
          ],
        ));
  }
}
