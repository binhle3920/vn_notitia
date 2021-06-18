import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidScreen extends StatefulWidget {
  final String city;
  final int cityIndex;

  const CovidScreen({Key key, @required this.city, @required this.cityIndex})
      : super(key: key);
  @override
  _CovidScreenState createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen>
    with TickerProviderStateMixin {
  int inf, act, re, dead;
  AnimationController animationController;

  Future getJson() async {
    //URL to fetch data information
    final apiEndPoint =
        "https://data.opendevelopmentmekong.net/api/3/action/datastore_search?q=" +
            widget.city +
            "&resource_id=b15e8f4b-c905-48fb-973e-d412e2759f55";
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    //Instance of Response
    return json.decode(apiResponse.body);
  }

  Future<String> getCovidData() async {
    var data = await getJson();
    inf = data['result']['records'][0]['Số ca nhiễm'];
    act = data['result']['records'][0]['Đang điều trị'];
    re = data['result']['records'][0]['Bình phục'];
    dead = data['result']['records'][0]['Tử vong'];

    return Future.value("Data load successfully"); // return your response
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getCovidData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            animationController.forward();
            return buildWaitingScreen();
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return buildMainScreen();
          }
        });
  }

  Widget buildMainScreen() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 255, 247, 1),
      appBar: AppBar(
        title: Text(widget.city),
        centerTitle: true,
      ),
      bottomNavigationBar:
          BottomNavigation(city: widget.city, cityIndex: widget.cityIndex),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/doodle.png",
                    width: 65,
                    height: 65,
                  ),
                ),
                Center(
                    child: Text(
                  "CORONA",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Roboto',
                      color: new Color(0xFF1A535C)),
                )),
                Container(
                    child: Image.asset(
                  "assets/images/plane.png",
                  width: 65,
                  height: 65,
                )),
              ],
            ),
            Stack(fit: StackFit.loose, children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  "assets/images/background.jpg",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Column(children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 30, top: 90),
                            child: Text(
                              'Số ca nhiễm',
                              style: TextStyle(
                                  color: Color(0xff1A535C), fontSize: 18.0),
                            )),
                        Text(
                          inf.toString(),
                          style: TextStyle(
                              color: Color(0xffFF6B6B), fontSize: 36.0),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 30, top: 90),
                            child: Text(
                              'Tử vong',
                              style: TextStyle(
                                  color: Color(0xff1A535C), fontSize: 18.0),
                            )),
                        Text(
                          dead.toString(),
                          style: TextStyle(
                              color: Color(0xffFF6B6B), fontSize: 36.0),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 30, top: 10),
                            child: Text(
                              'Đang điều trị',
                              style: TextStyle(
                                  color: Color(0xff1A535C), fontSize: 18.0),
                            )),
                        Text(
                          act.toString(),
                          style: TextStyle(
                              color: Color(0xffFF6B6B), fontSize: 36.0),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 30, top: 10),
                            child: Text(
                              'Đã hồi phục',
                              style: TextStyle(
                                  color: Color(0xff1A535C), fontSize: 18.0),
                            )),
                        Text(
                          re.toString(),
                          style: TextStyle(
                              color: Color(0xffFF6B6B), fontSize: 36.0),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ]),
            Divider(
              thickness: 1,
              color: Color(0xff4ECDC4),
              indent: 75.0,
              endIndent: 75.0,
            ),
            Container(
                child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          "assets/images/rectange_covid.png",
                          height: 500,
                          width: double.infinity,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Text(
                        "Bạn có thể khai báo y tế tại đây",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0xffFF0303)),
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: IconButton(
                          onPressed: () async {
                            const url = 'https://tokhaiyte.vn/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: Image.asset('assets/images/khaibao.png'),
                          iconSize: 50,
                          splashRadius: 30,
                          splashColor: Color(0xff4ECDC4),
                          highlightColor: Colors.white),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 255, 247, 1),
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
          child: Image.asset('assets/images/load_rotate.png',
              width: 80, height: 80),
        ),
      ),
    );
  }
}
