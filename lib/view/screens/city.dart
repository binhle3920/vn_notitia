import 'package:flutter/material.dart';
import 'package:vn_notitia/view/screens/news.dart';

class ChooseCityScreen extends StatefulWidget {
  const ChooseCityScreen({Key key}) : super(key: key);

  @override
  _ChooseCityScreenState createState() => _ChooseCityScreenState();
}

class _ChooseCityScreenState extends State<ChooseCityScreen> {
  String _dropDownValue;
  List<String> _dropDownList;

  @override
  void initState() {
    _dropDownList = ['Ha Noi', 'TP.HCM', 'Da Nang', 'Kontum'];
    _dropDownValue = _dropDownList[0];
    super.initState();
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
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Image.asset(
                'assets/images/map.png',
                width: 221,
                height: 465
              ),
            ),
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
              style: TextStyle(fontSize: 50, color: Color.fromRGBO(78, 205, 196, 1))
          ),
          items: _dropDownList.map((val) {
            return DropdownMenuItem(child: Text(val), value: val);
          }).toList(),
          onChanged: (val) {
            setState(() {
              _dropDownValue = val;
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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 5.0),
            blurRadius: 30.0
          )
        ]
      ),
      child: RawMaterialButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsScreen()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        fillColor: Color.fromRGBO(78, 205, 196, 1),
        hoverColor: Color.fromRGBO(247, 255, 247, 1),
        child: Center(
          child: Text(
            "NEXT",
            style: TextStyle(
                color: Color.fromRGBO(247, 255, 247, 1),
                fontSize: 25
            ),
          ),
        ),
      ),
    );
  }
}
