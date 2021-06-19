class FoodInfo {
  final String foodName;
  final String foodRef;
  final String foodImg;
  final String foodPrice;
  final int maxInfoLine;

  FoodInfo(this.foodName, this.foodRef, this.foodImg, this.foodPrice,
      this.maxInfoLine);

  factory FoodInfo.fromJson(dynamic json) {
    return FoodInfo(
      json['name'] as String,
      json['info'] as String,
      json['img'] as String,
      json['price'] as String,
      json['maxline'] as int,
    );
  }

  @override
  String toString() {
    return '{ ${this.foodName}, ${this.foodRef}, ${this.foodImg}, ${this.foodPrice}, ${this.maxInfoLine} }';
  }
}
