class FoodInfo {
  final String foodName;
  final String foodRef;
  final String foodImg;
  final String foodPrice;

  FoodInfo(this.foodName, this.foodRef, this.foodImg, this.foodPrice);

  factory FoodInfo.fromJson(dynamic json) {
    return FoodInfo(
      json['name'] as String,
      json['info'] as String,
      json['img'] as String,
      json['price'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.foodName}, ${this.foodRef}, ${this.foodImg}, ${this.foodPrice} }';
  }
}
