import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'FoodInfo.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreen createState() => _FoodScreen();
}

class _FoodScreen extends State<FoodScreen> {
  final String _city = 'Hà Nội';
  String _quote;

  void _changeText(String t) {
    setState(() {
      _quote = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return new Scaffold(
      backgroundColor: Color(0xffFAE6B1),
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
            child: Text(
              'Hello world',
              textAlign: TextAlign.center,
            ),
          ),
          //info
          Container(
              margin:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: new BoxDecoration(
                color: Colors.white,
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
                        startIndex: -1, stateCount: 3)
                    .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                  new Offset(-370.0, -40.0),
                  new Offset(0.0, 0.0),
                  new Offset(370.0, -40.0)
                ]),
                itemBuilder: (context, index) {
                  // _quote = foods[index].foodFact;
                  return new Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          foods[index].foodName,
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset(
                          'assets/' + foods[index].foodImg,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          foods[index].foodPrice,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: foods.length,
                itemWidth: MediaQuery.of(context).size.width,
              ))
        ],
      ))),
    );
  }
}
