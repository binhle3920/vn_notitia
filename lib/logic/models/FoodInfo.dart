class FoodInfo {
  final String foodName;
  final String foodRef;
  final String foodImg;
  final String foodPrice;
  final String foodFact;

  FoodInfo(
      this.foodName, this.foodRef, this.foodImg, this.foodPrice, this.foodFact);

  factory FoodInfo.fromJson(dynamic json) {
    return FoodInfo(
      json['name'] as String,
      json['ref'] as String,
      json['img'] as String,
      json['price'] as String,
      json['fact'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.foodName}, ${this.foodRef}, ${this.foodImg}, ${this.foodPrice}, ${this.foodFact} }';
  }
}
