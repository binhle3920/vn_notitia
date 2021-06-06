import 'package:flutter/material.dart';
import '../utils/navigation_bar.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreen createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("This is a new Screen"),
        ),
        bottomNavigationBar: BottomNavigation(),
        body: ListView(
          children: [
            Container(
                height: 76,
                width: 375,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/doodle.png"),
                    Center(
                        child: Text(
                      "TIN TỨC",
                      style: TextStyle(fontSize: 40, fontFamily: 'Slabo'),
                    )),
                    Image.asset("assets/images/plane.png")
                  ],
                )),
            Column(
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
            Container(
                padding: const EdgeInsets.all(20),
                height: 130,
                width: 146,
                color: Colors.white,
                child: new ListView(children: [
                  Row(
                    children: [
                      Container(
                          //padding: const EdgeInsets.only(top: 50),
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("assets/images/new_1.jpg",
                            width: 133, height: 96),
                      )),
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 8),
                              child: Text(
                                '6 nhánh lây nhiễm lớn từ Hội thánh Truyền giáo Phục hưng',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 8),
                              child: Text(
                                'Thứ tư, 02/06/2021 - 20:20',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ])),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 129,
              endIndent: 120,
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  height: 40,
                  child: Image.asset("assets/images/Logo_ThanhNien.png",
                      width: 130, height: 25),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.all(20),
                height: 130,
                width: 146,
                color: Colors.white,
                child: ListView(children: [
                  Row(
                    children: [
                      Container(
                        //padding: const EdgeInsets.only(top: 50),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/images/new_2.png",
                              width: 133, height: 96),
                        ),
                      ),
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 8),
                              child: Text(
                                'TP.HCM: Nhiều quận xuất hiện ca nghi nhiễm Covid-19 mới; 3 trường hợp F2 thành F0',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 8),
                              child: Text(
                                'Thứ tư, 02/06/2021 - 20:04',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ])),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 120,
              endIndent: 120,
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  height: 40,
                  child: Image.asset("assets/images/Logo_DanTri.png",
                      width: 130, height: 25),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.all(20),
                height: 130,
                width: 146,
                color: Colors.white,
                child: ListView(children: [
                  Row(
                    children: [
                      Container(
                        //padding: const EdgeInsets.only(top: 50),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/images/new_3.jpg",
                              width: 133, height: 96),
                        ),
                      ),
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*2*/
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 8),
                              child: Text(
                                'Tối 2/6 thêm 138 ca mắc Covid-19, TPHCM liên tiếp ghi nhận trường hợp mới',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, bottom: 8),
                              child: Text(
                                'Thứ tư, 02/06/2021 - 18:38',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ])),
          ],
        ));
  }
}
