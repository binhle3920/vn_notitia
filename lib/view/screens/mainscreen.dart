import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vn_notitia/logic/models/Information.dart';
import 'package:vn_notitia/view/screens/city.dart';
import 'package:vn_notitia/view/screens/covid.dart';
import 'package:vn_notitia/view/screens/cuisine.dart';
import 'package:vn_notitia/view/screens/news.dart';
import 'package:vn_notitia/view/screens/travel.dart';
import 'package:vn_notitia/view/screens/history.dart';
import '../utils/navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';

class MainScreen extends StatefulWidget {
  final String city;
  final int cityIndex;

  const MainScreen({Key key, @required this.city, @required this.cityIndex}) : super(key:key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Information infor;
  void initState() {
    super.initState();
    FirebaseDatabase.instance.reference().child('0').once().then((
        DataSnapshot snapshot)     {
      infor = Information.fromDb(snapshot);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 255, 247, 1),
      appBar: AppBar(
        title: Text(infor.city),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChooseCityScreen()));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(city: widget.city, cityIndex: widget.cityIndex),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child:  ClipRRect(borderRadius: new BorderRadius.circular(25.0),child: Image.network(infor.img,
              fit: BoxFit.cover,),),


          ),
          Divider(
            thickness: 1,
            color: Color(0xff4ECDC4),
            indent: 75.0,
            endIndent: 75.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: EdgeInsets.all(25),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CovidScreen(city: widget.city, cityIndex: widget.cityIndex)),
                  );
                },
                icon: Image.asset('assets/images/covid.png'),
                iconSize: 70,
              ),
              Spacer(),
              Container(
                height: 80,
                child: VerticalDivider(color: Color(0xff4ECDC4)),
                padding: EdgeInsets.only(top: 30),
              ),
              Spacer(),
              IconButton(
                padding: EdgeInsets.all(10),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsScreen(city: widget.city, cityIndex: widget.cityIndex)),
                  );
                },
                icon: Image.asset('assets/images/news.png'),
                iconSize: 70,
              ),
              Spacer(),
              Container(
                height: 80,
                child: VerticalDivider(color: Color(0xff4ECDC4)),
                padding: EdgeInsets.only(top: 30),
              ),
              Spacer(),
              IconButton(
                padding: EdgeInsets.all(10),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryScreen(city: widget.city, cityIndex: widget.cityIndex)),
                  );
                },
                icon: Image.asset("assets/images/history.png"),
                iconSize: 70,
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Color(0xff4ECDC4),
            indent: 75.0,
            endIndent: 75.0,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  padding: EdgeInsets.all(25),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TravelScreen(city: widget.city, cityIndex: widget.cityIndex)),
                    );
                  },
                  icon: Image.asset('assets/images/place.png'),
                  iconSize: 70),
              Spacer(),
              Container(
                height: 80,
                child: VerticalDivider(color: Color(0xff4ECDC4)),
                padding: EdgeInsets.only(top: 30),
              ),
              Spacer(),
              IconButton(
                // padding: EdgeInsets.all(10) ,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodScreen(city: widget.city, cityIndex: widget.cityIndex)),
                  );
                },
                icon: Image.asset('assets/images/food.png'),
                iconSize: 70,
              ),
              Spacer(),
              Container(
                height: 80,
                child: VerticalDivider(color: Color(0xff4ECDC4)),
                padding: EdgeInsets.only(top: 30),
              ),
              Spacer(),
              IconButton(
                // padding: EdgeInsets.all(10) ,
                onPressed: () {},
                icon: Image.asset("assets/images/game.png"),
                iconSize: 70,
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Color(0xff4ECDC4),
            indent: 75.0,
            endIndent: 75.0,
          ),
          Container(
            child: Center(
              child: Text(
                " \n" + infor.sentence1 + "\n" + infor.sentence2 + "\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xff4ECDC4),
            indent: 75.0,
            endIndent: 75.0,
          ),
          Container(
            child: Image.asset(
              'assets/images/square.png',
              height: 100,
              width: 100,
              alignment: Alignment.center,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                " \n" + infor.square + "\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.red),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xff4ECDC4),
            indent: 75.0,
            endIndent: 75.0,
          ),
          Container(
            child: Image.asset(
              'assets/images/population.png',
              height: 100,
              width: 100,
              alignment: Alignment.center,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                " \n" + infor.population + " người\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.red),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xff4ECDC4),
            indent: 75.0,
            endIndent: 75.0,
          ),
          Container(
            child: Image.asset(
              'assets/images/licenseplate.png',
              height: 100,
              width: 100,
              alignment: Alignment.center,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                " \n "+ infor.lp +"\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
