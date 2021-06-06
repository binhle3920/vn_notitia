import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConvexButton.fab(
      icon: Icons.home,
      color: Colors.white,
      backgroundColor: Color.fromRGBO(26, 83, 92, 1),
      onTap: () {},
    );
  }
}

