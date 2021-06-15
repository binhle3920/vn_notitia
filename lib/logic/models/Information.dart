import 'package:firebase_database/firebase_database.dart';
class Information {
  String city;
  String square;
  String population;
  String sentence1;
  String sentence2;
  String lp;
  String img;

  // Information(this.city, this.square, this.population,this.sentence1, this.sentence2, this.lp, this.img);

  Information.fromDb(DataSnapshot data)
  {
    var da = data.value;
    Information c;
    c.city = da['PROVINCE'];
    c.square = da['AREA'];
    c.population = da['POPULATION'];
    c.sentence1 = da['CDTN1'];
    c.sentence2 = da['CDTN2'];
    c.lp = da['LP'];
    c.img = da['IMG'];
  }
}
