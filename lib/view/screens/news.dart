import 'package:flutter/material.dart';
import '../utils/navigation_bar.dart';

class NewsScreen extends StatefulWidget {
  final String city;
  final int cityIndex;

  const NewsScreen({Key key, @required this.city, @required this.cityIndex }) : super(key: key);
  @override
  _NewsScreen createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      bottomNavigationBar: BottomNavigation(city: widget.city, cityIndex: widget.cityIndex),
      body: Container(
        child: Column(
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
            Container(
              height: 130,
              color: Colors.white,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset("assets/images/new_1.jpg",
                                width: 133, height: 96),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Container(
                            width: 240,
                            padding: EdgeInsets.only(
                                left: 10, top: 30, bottom: 20, right: 10),
                            child: Text(
                                '6 nhánh lây nhiễm lớn từ Hội thánh Truyền giáo Phục hưng',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Thứ tư, 02/06/2021 - 20:20',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset("assets/images/new_1.jpg",
                                width: 133, height: 96),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Container(
                            width: 240,
                            padding: EdgeInsets.only(
                                left: 10, top: 30, bottom: 20, right: 10),
                            child: Text(
                                '6 nhánh lây nhiễm lớn từ Hội thánh Truyền giáo Phục hưng',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Thứ tư, 02/06/2021 - 20:20',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 129,
              endIndent: 120,
              color: Colors.black,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  height: 60,
                  child: Image.asset("assets/images/Logo_ThanhNien.png",
                      width: 130, height: 25),
                )
              ],
            ),
            Container(
              height: 130,
              color: Colors.white,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset("assets/images/new_2.png",
                                width: 133, height: 96),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Container(
                            width: 240,
                            padding: EdgeInsets.only(
                                left: 10, top: 30, bottom: 20, right: 10),
                            child: Text(
                                'TP.HCM: Nhiều quận xuất hiện ca nghi nhiễm Covid-19 mới; 3 trường hợp F2 thành F0',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Thứ tư, 02/06/2021 - 20:20',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset("assets/images/new_2.png",
                                width: 133, height: 96),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Container(
                            width: 240,
                            padding: EdgeInsets.only(
                                left: 10, top: 30, bottom: 20, right: 10),
                            child: Text(
                                'TP.HCM: Nhiều quận xuất hiện ca nghi nhiễm Covid-19 mới; 3 trường hợp F2 thành F0',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Thứ tư, 02/06/2021 - 20:20',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 129,
              endIndent: 120,
              color: Colors.black,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  height: 60,
                  child: Image.asset("assets/images/Logo_DanTri.png",
                      width: 130, height: 25),
                )
              ],
            ),
            Container(
              height: 130,
              color: Colors.white,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset("assets/images/new_3.jpg",
                                width: 133, height: 96),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Container(
                            width: 240,
                            padding: EdgeInsets.only(
                                left: 10, top: 30, bottom: 20, right: 10),
                            child: Text(
                                'Tối 2/6 thêm 138 ca mắc Covid-19, TPHCM liên tiếp ghi nhận trường hợp mới',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Thứ tư, 02/06/2021 - 20:20',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset("assets/images/new_3.jpg",
                                width: 133, height: 96),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              child: Container(
                            width: 240,
                            padding: EdgeInsets.only(
                                left: 10, top: 30, bottom: 20, right: 10),
                            child: Text(
                                'Tối 2/6 thêm 138 ca mắc Covid-19, TPHCM liên tiếp ghi nhận trường hợp mới',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          )),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Thứ tư, 02/06/2021 - 20:20',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
