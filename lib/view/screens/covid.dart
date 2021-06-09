import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/navigation_bar.dart';
class CovidScreen extends StatefulWidget {

  @override
  _CovidScreenState createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Covid")),
      bottomNavigationBar: BottomNavigation(),
      body:ListView(
        children: <Widget>  [
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

          Container(
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[

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

                Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: Text(
                      '3/6/2021',
                      style: TextStyle(color: Color(0xffFF6B6B),
                          fontSize: 22.0),
                    )
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 0,
                      child: Container(
                          padding: EdgeInsets.only(left : 30, top: 60),
                          child: Text(
                            'Ca nhiễm mới  ',
                            style: TextStyle(color: Color(0xff1A535C),
                                fontSize: 22.0),
                          )
                      ),
                    ),
                    Spacer(),
                    Flexible(
                        flex: 4,
                        child: Container(
                          // alignment: Alignment.topRight,
                            padding: EdgeInsets.only(top: 60),
                            child: Text(
                              'Ca tử vong mới',
                              style: TextStyle(color: Color(0xff1A535C),
                                  fontSize: 22.0),
                            )
                        )
                    ),

                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        // alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 70, top: 100),
                          child: Text(
                            '12',
                            style: TextStyle(color: Color(0xffFF6B6B),
                                fontSize: 30.0),
                          )
                      ),
                    ),
                    Spacer(flex: 2,),
                    Flexible(
                        flex: 4,
                        child: Container(
                            padding: EdgeInsets.only(top: 100),
                            child: Text(
                              '1',
                              style: TextStyle(color: Color(0xffFF6B6B),
                                  fontSize: 30.0),
                            )
                        )
                    ),

                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 0,
                      child: Container(
                          padding: EdgeInsets.only(left : 30, top: 160),
                          child: Text(
                            'Tổng ca nhiễm',
                            style: TextStyle(color: Color(0xff1A535C),
                                fontSize: 22.0),
                          )
                      ),
                    ),
                    Spacer(),
                    Flexible(
                        flex: 4,
                        child: Container(
                          // alignment: Alignment.topRight,
                            padding: EdgeInsets.only(top: 160),
                            child: Text(
                              'Tổng ca tử vong',
                              style: TextStyle(color: Color(0xff1A535C),
                                  fontSize: 22.0),
                            )
                        )
                    ),

                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        // alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 70, top: 200),
                          child: Text(
                            '14',
                            style: TextStyle(color: Color(0xffFF6B6B),
                                fontSize: 30.0),
                          )
                      ),
                    ),
                    Spacer(flex: 2,),
                    Flexible(
                        flex: 4,
                        child: Container(
                            padding: EdgeInsets.only(top: 200),
                            child: Text(
                              '2',
                              style: TextStyle(color: Color(0xffFF6B6B),
                                  fontSize: 30.0),
                            )
                        )
                    ),

                  ],
                ),


              ],
            ),
          ),

          Divider(thickness: 1, color: Color(0xff4ECDC4),indent: 75.0, endIndent: 75.0,),

          Container(
              child: Stack(
                children: <Widget> [
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
                        child: Text("Bạn có thể khai báo y tế tại đây" ,
                          textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0, color: Color(0xffFF0303)),),
                      ),
                      Flexible(
                          flex: 0,
                          child: IconButton(onPressed: (){}, icon: Image.asset('assets/images/khaibao.png'),
                            iconSize: 50,)),

                    ],
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
