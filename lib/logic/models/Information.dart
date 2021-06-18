import 'package:firebase_database/firebase_database.dart';

class Information {
  String cityName;
  String square;
  String population;
  String sentence1;
  String sentence2;
  String lp;
  String img;

  Information(this.cityName, this.square, this.population, this.sentence1,
      this.sentence2, this.lp, this.img);

  factory Information.fromDb(DataSnapshot data) {
    var da = data.value;

    return Information(da['PROVINCE'], da['AREA'], da['POPULATION'],
        da['CDTN1'], da['CDTN2'], da['LP'], da['IMG']);
  }

  @override
  String toString() {
    return '{ ${this.cityName}, ${this.square}, ${this.sentence1}, ${this.sentence2}, ${this.lp}, ${this.img}  }';
  }
}
