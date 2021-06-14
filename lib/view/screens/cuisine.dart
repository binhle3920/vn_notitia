import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../logic/models/FoodInfo.dart';
import 'dart:convert';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreen createState() => _FoodScreen();
}

class _FoodScreen extends State<FoodScreen> {
  final String _city = 'Hà Nội';
  String _text;

  List _temp = [];
  List<FoodInfo> _foods = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/food.json');
    final data = await json.decode(response);
    setState(() {
      _temp = data["foods"];
      for (int i = 0; i < _temp.length; i++)
        _foods.add(FoodInfo.fromJson(_temp[i]));

      _text = _foods[0].foodRef; // init first food
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '$_city',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      body: new Container(
          child: SafeArea(
              child: Column(
        children: <Widget>[
          // quotes
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
                bottomLeft: const Radius.circular(40.0),
                bottomRight: const Radius.circular(40.0),
              ),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '$_text',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          Spacer(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.width / 2,
                child: new Align(
                  alignment: FractionalOffset(0, 0),
                  child: ClipPath(
                    clipper: new CustomHalfCircleClipper(),
                    child: new Container(
                      height: MediaQuery.of(context).size.width * 2,
                      width: MediaQuery.of(context).size.width * 2,
                      decoration: new BoxDecoration(
                        color: Color(0xffFAE6B1),
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 2),
                      ),
                    ),
                  ),
                ),
              ),
              //info
              Container(
                width: MediaQuery.of(context).size.width,
                height: 600,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                    bottomLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40.0),
                  ),
                ),
                child: new Swiper(
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption: new CustomLayoutOption(
                          startIndex: -1, stateCount: _foods.length)
                      .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                    new Offset(-370.0, -40.0),
                    new Offset(0.0, 0.0),
                    new Offset(370.0, -40.0)
                  ]),
                  onIndexChanged: (int index) {
                    setState(() {
                      _text = _foods[index].foodRef;
                    });
                  },
                  itemCount: _foods.length,
                  itemWidth: MediaQuery.of(context).size.width,
                  itemBuilder: (context, index) {
                    // _quote = foods[index].foodFact;
                    return new Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            _foods[index].foodName,
                            style: TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset(
                            'assets/images/' + _foods[index].foodImg,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            _foods[index].foodPrice,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // circle pattern
            ],
          )
        ],
      ))),
    );
  }
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0.0, size.height / 2);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
