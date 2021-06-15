import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vn_notitia/logic/models/HistoryVid.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:vn_notitia/view/utils/navigation_bar.dart';

class HistoryScreen extends StatefulWidget {
  final String city;
  final int cityIndex;

  const HistoryScreen({Key key, @required this.city, @required this.cityIndex }) : super(key: key);

  @override
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  String _city = "Hà Nội";
  List<HistoryVid> _videos = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/history.json');
    final data = await json.decode(response);
    setState(() {
      List _temp = data["history_videos"];
      for (int i = 0; i < _temp.length; i++)
        _videos.add(HistoryVid.fromJson(_temp[i]));
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_city),
      ),
      bottomNavigationBar: BottomNavigation(city: widget.city, cityIndex: widget.cityIndex),
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: _videos.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.asset(
                                'assets/images/' + _videos[index].avatar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                _videos[index].userName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  _videos[index].videoLink),
                              flags: YoutubePlayerFlags(autoPlay: false),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.blue,
                            progressColors: ProgressBarColors(
                              playedColor: Colors.blue,
                              handleColor: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Text(
                          _videos[index].videoTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 10,
                    thickness: 3,
                    color: Colors.white54,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
