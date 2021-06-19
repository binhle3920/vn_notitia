import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vn_notitia/logic/models/HistoryVid.dart';
import 'package:vn_notitia/view/screens/city.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:vn_notitia/view/utils/navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class HistoryScreen extends StatefulWidget {
  final String city;
  final int cityIndex;

  const HistoryScreen({Key key, @required this.city, @required this.cityIndex})
      : super(key: key);

  @override
  _HistoryScreen createState() => _HistoryScreen();
}

class _HistoryScreen extends State<HistoryScreen> {
  List<HistoryVid> _videos = [];
  Future<String> _data;

  @override
  void initState() {
    super.initState();
    _data = loadData();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return FutureBuilder<String>(
        future: _data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
              return Center(child: Text('Can not connect'));
            case ConnectionState.done:
              return buildHistoryScreen();
            default:
              return null;
          }
        });
  }

  Future<String> loadData() async {
    await FirebaseDatabase.instance
        .reference()
        .child('${widget.cityIndex}/History')
        .once()
        .then((DataSnapshot snapshot) {
      if (snapshot.value == null) return;
      Map<String, dynamic> result =
          Map<String, dynamic>.from(snapshot.value as Map<dynamic, dynamic>);
      result.forEach((key, values) {
        _videos.add(HistoryVid.fromJson(values));
      });
    });
    return Future.value("Data load successfully");
  }

  Widget buildHistoryScreen() {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              child: Text(widget.city),
            ),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ChooseCityScreen()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigation(city: widget.city, cityIndex: widget.cityIndex),
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: _videos.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    padding: new EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xff099ddff),
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              backgroundImage: NetworkImage(
                                _videos[index].avatar,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                _videos[index].userName,
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
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
                    thickness: 2,
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
