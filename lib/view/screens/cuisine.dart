import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vn_notitia/view/screens/city.dart';
import '../../logic/models/FoodInfo.dart';
import 'package:vn_notitia/view/utils/navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FoodScreen extends StatefulWidget {
  final String city;
  final int cityIndex;

  const FoodScreen({Key key, @required this.city, @required this.cityIndex})
      : super(key: key);

  @override
  _FoodScreen createState() => _FoodScreen();
}

class _FoodScreen extends State<FoodScreen> {
  String _text;
  List<FoodInfo> _foods = [];
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
              return buildFoodScreen();
            default:
              return null;
          }
        });
  }

  Future<String> loadData() async {
    await FirebaseDatabase.instance
        .reference()
        .child('${widget.cityIndex}/Food')
        .once()
        .then((DataSnapshot snapshot) {
      if (snapshot.value == null) return;
      Map<String, dynamic> result =
          Map<String, dynamic>.from(snapshot.value as Map<dynamic, dynamic>);
      result.forEach((key, values) {
        _foods.add(FoodInfo.fromJson(values));
      });
      _text = _foods[0].foodRef; // init first food
    });
    return Future.value("Data load successfully");
  }

  Widget buildFoodScreen() {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      bottomNavigationBar:
          BottomNavigation(city: widget.city, cityIndex: widget.cityIndex),
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
            child: Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 300.0,
                  maxWidth: 300.0,
                  minHeight: 150.0,
                  maxHeight: 150.0,
                ),
                child: Center(
                  child: AutoSizeText(
                    '$_text',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
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
                height: 520,
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
                          startIndex: -1, stateCount: 3)
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
                          ClipOval(
                            child: Image.network(
                              _foods[index].foodImg,
                              height: 300,
                              width: 300,
                              fit: BoxFit.cover,
                            ),
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
