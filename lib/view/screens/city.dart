import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vn_notitia/view/screens/mainscreen.dart';
import '../../logic/models/CityCordinate.dart';
import 'dart:convert';

class ChooseCityScreen extends StatefulWidget {
  const ChooseCityScreen({Key key}) : super(key: key);

  @override
  _ChooseCityScreenState createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen>
    with TickerProviderStateMixin {
  static String _dropDownValue = "Thành phố";
  List<String> _dropDownList = [];
  List<CityCordinate> _listCity = [];

  double flagTopPos, flagLeftPos;
  int curCity;

  Future<void> readJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString('assets/data/city_cor.json');
    final data = await json.decode(response);

    List _temp = data["cities"];
    for (int i = 0; i < _temp.length; i++)
      //save list city to CityCordinate object
      _listCity.add(CityCordinate.fromJson(_temp[i]));

    setState(() {
      for (int i = 0; i < _listCity.length; i++)
        _dropDownList.add(_listCity[i].city);

      curCity = 0;
      _dropDownValue = _dropDownList[0];
      flagTopPos = _listCity[0].top.toDouble();
      flagLeftPos = _listCity[0].left.toDouble();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 255, 247, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _dropdownButton(),
            Stack(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: Image.asset('assets/images/map.png',
                    width: 221, height: 465),
              ),
              Positioned(
                  top: flagTopPos,
                  left: flagLeftPos,
                  child: Image.asset(
                    'assets/images/flag.png',
                    width: 30,
                    height: 30,
                  ))
            ]),
            _nextButton()
          ],
        ),
      ),
    );
  }

  Widget _dropdownButton() {
    return Container(
      height: 70,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          iconSize: 50,
          iconEnabledColor: Color.fromRGBO(78, 205, 196, 1),
          isExpanded: false,
          hint: Text(
            _dropDownValue,
            style: GoogleFonts.getFont('Roboto',
                textStyle: TextStyle(
                  fontSize: 40,
                  color: Color.fromRGBO(78, 205, 196, 1),
                )),
          ),
          items: _dropDownList.map((val) {
            return DropdownMenuItem(child: Text(val), value: val);
          }).toList(),
          onChanged: (val) {
            setState(() {
              _dropDownValue = val;
              for (int i = 0; i < _listCity.length; i++) {
                if (_listCity[i].city == val) {
                  flagTopPos = _listCity[i].top.toDouble();
                  flagLeftPos = _listCity[i].left.toDouble();
                  curCity = i;
                  break;
                }
              }
            });
          },
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      height: 59,
      width: 187.5,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey, offset: Offset(0.0, 5.0), blurRadius: 30.0)
      ]),
      child: RawMaterialButton(
        onPressed: () {
          if (curCity == null) {
            return;
          }

          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  MainScreen(city: _dropDownValue, cityIndex: curCity)));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        fillColor: Color.fromRGBO(78, 205, 196, 1),
        hoverColor: Color.fromRGBO(247, 255, 247, 1),
        child: Center(
          child: Text(
            "NEXT",
            style: TextStyle(
                color: Color.fromRGBO(247, 255, 247, 1), fontSize: 25),
          ),
        ),
      ),
    );
  }
}
