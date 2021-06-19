import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/screens/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Slabo',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(26, 83, 92, 1)
        )
      ),

      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
