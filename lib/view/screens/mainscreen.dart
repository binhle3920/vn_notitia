import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(1),
              child:  Image(image: AssetImage('assets/images/DN.jpg'))
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.all(25) ,
                onPressed: () {},
                icon: Image.asset('assets/images/covid.png'),
                iconSize: 70,
              ),


              IconButton(
                padding: EdgeInsets.all(25) ,
                onPressed: () {},
                icon: Image.asset('assets/images/news.png'),
                iconSize: 70,
              ),

              IconButton(
                padding: EdgeInsets.all(25) ,
                onPressed: () {},
                icon: Image.asset("assets/images/history.png"),
                iconSize: 70,
              ),
            ],
          ),


          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              IconButton(
                  padding: EdgeInsets.all(25) ,
                  onPressed: () {},
                  icon: Image.asset('assets/images/place.png'),
                  iconSize: 70
              ),


              IconButton(
                padding: EdgeInsets.all(25) ,
                onPressed: () {},
                icon: Image.asset('assets/images/food.png'),
                iconSize: 70,
              ),
              IconButton(
                padding: EdgeInsets.all(25) ,
                onPressed: () {},
                icon: Image.asset("assets/images/game.png"),
                iconSize: 70,
              ),
            ],
          ),


          Container(
            child: Center(
              child: Text(" \nRủ nhau mua tép Nam Ô\n Sẵn bờ cát trắng, phơi khô đem về\n\n" ,
                textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0),),
            ),
          ),
          Container(
            child: Image.asset('assets/images/square.png', height: 100, width: 100,alignment: Alignment.center,),
          ),
          Container(
            child: Center(
              child: Text(" \n496.3 km2\n" ,
                textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0, color: Colors.red),),
            ),
          ),

          Container(
            child: Image.asset('assets/images/population.png', height: 100, width: 100,alignment: Alignment.center,),
          ),

          Container(
            child: Center(
              child: Text(" \n1.137.310 người\n" ,
                textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0, color: Colors.red),),
            ),
          ),

          Container(
            child: Image.asset('assets/images/licenseplate.png', height: 100, width: 100,alignment: Alignment.center,),
          ),

          Container(
            child: Center(
              child: Text(" \n43\n" ,
                textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0, color: Colors.red),),
            ),
          )


        ],
      ),
    );
  }
}
