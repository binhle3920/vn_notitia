import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:vn_notitia/view/screens/mainscreen.dart';
import 'package:vn_notitia/view/screens/news.dart';
import 'package:vn_notitia/view/screens/travel.dart';
import 'package:vn_notitia/view/screens/history.dart';
import 'package:vn_notitia/view/screens/cuisine.dart';

class BottomNavigation extends StatelessWidget {
  final String city;
  final int cityIndex;
  static int currentTabIndex = 2;

  const BottomNavigation(
      {Key key, @required this.city, @required this.cityIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.my_library_books, title: "News"),
        TabItem(icon: Icons.history, title: "History"),
        TabItem(icon: Icons.home, title: "Home"),
        TabItem(icon: Icons.wallet_travel, title: "Travel"),
        TabItem(icon: Icons.fastfood, title: "Food")
      ],
      initialActiveIndex: currentTabIndex,
      color: Colors.white,
      backgroundColor: Color.fromRGBO(26, 83, 92, 1),
      onTap: (int i) {
        if (i == currentTabIndex) {
          return;
        }

        switch (i) {
          case 0:
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    (NewsScreen(city: city, cityIndex: cityIndex))));
            currentTabIndex = i;
            break;
          case 1:
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    (HistoryScreen(city: city, cityIndex: cityIndex))));
            currentTabIndex = i;
            break;
          case 2:
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    (MainScreen(city: city, cityIndex: cityIndex))));
            currentTabIndex = i;
            break;
          case 3:
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    (TravelScreen(city: city, cityIndex: cityIndex))));
            currentTabIndex = i;
            break;
          case 4:
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    (FoodScreen(city: city, cityIndex: cityIndex))));
            currentTabIndex = i;
            break;
        }
      },
    );
  }
}
