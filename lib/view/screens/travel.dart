import 'package:flutter/material.dart';
import '../utils/navigation_bar.dart';

class TravelScreen extends StatefulWidget {
  @override
  _TravelScreen createState() => _TravelScreen();
}

class _TravelScreen extends State<TravelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel"),
      ),
      bottomNavigationBar: BottomNavigation(),
      body: Container(
        child: Column(
          children: [
            Container(
                height: 80,
                width: 375,
                color: Colors.white,
                child: Row(
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
                      "DU LỊCH",
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
                        ))
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 8,
                      height: 26,
                      color: Colors.yellow,
                    ),
                    Center(
                        child: Text(
                      "Kiến trúc",
                      style: TextStyle(fontSize: 25, color: Colors.redAccent),
                    )),
                    Container(
                      width: 8,
                      height: 26,
                      color: Colors.yellow,
                    ),
                  ],
                )),
            Container(
              height: 240.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/Travel_BenNhaRong.jpg",
                              width: 335,
                              height: 215,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30, bottom: 8),
                        child: Center(
                            child: Text(
                          "BẾN NHÀ RỒNG",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/Travel_BenNhaRong.jpg",
                              width: 335,
                              height: 215,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30, bottom: 8),
                        child: Center(
                            child: Text(
                          "NHÀ HÁT LỚN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/Travel_BenNhaRong.jpg",
                              width: 335,
                              height: 215,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30, bottom: 8),
                        child: Center(
                            child: Text(
                          "NHÀ THỜ ĐỨC BÀ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 70,
              endIndent: 70,
              color: Colors.black,
            ),
            Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 8,
                      height: 26,
                      color: Colors.yellow,
                    ),
                    Center(
                        child: Text(
                      "Vui chơi giải trí",
                      style: TextStyle(fontSize: 25, color: Colors.redAccent),
                    )),
                    Container(
                      width: 8,
                      height: 26,
                      color: Colors.yellow,
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 1),
              height: 240.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/Travel_SuoiTien.png",
                              width: 335,
                              height: 215,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30, top: 8),
                        child: Center(
                            child: Text(
                          "SUỐI TIÊN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/Travel_SuoiTien.png",
                              width: 335,
                              height: 215,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30, top: 8),
                        child: Center(
                            child: Text(
                          "ĐẦM SEN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/Travel_SuoiTien.png",
                              width: 335,
                              height: 215,
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 30, top: 8),
                        child: Center(
                            child: Text(
                          "THẢO CẦM VIÊN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
