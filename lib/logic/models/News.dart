import 'package:flutter/foundation.dart';

class Article {
  String title;
  String link;
  String description;
  String img;
  String time;

  Article(
      {@required this.title,
      @required this.link,
      @required this.description,
      @required this.img,
      @required this.time});
}
