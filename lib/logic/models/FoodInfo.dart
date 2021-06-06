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

// List<FoodInfo> foods = [
//   FoodInfo(
//       'Phở',
//       "Công cha cơm tấm mỡ hành,\n Nghĩa mẹ như Phở Hà thành Thăng Long",
//       "images/HN_Pho.png",
//       "1.000.000 VNĐ",
//       "Top 40 món ăn nhất định phải thử trên thế giới"),
//   // FoodInfo(
//   //     foodName: "Bún chả",
//   //     foodRef:
//   //         "... Có một ông đồ cuồng chữ ở nhà quê, một hôm khăn gói \n lên Hà Nội đã ứng khẩu đọc hai câu thơ khi ngửi thấy mùi khó tả: \n\n Ngàn năm bửu vật đất Thăng Long.\n Bún chả là đây có phải không?...",
//   //     foodImg: "images/HN_BunCha.png",
//   //     foodPrice: "100.000 VNĐ",
//   //     foodFact:
//   //         "Trong chuyến thăm Việt Nam năm 2016, tổng thống Mỹ Barack Obama cùng đầu bếp nổi tiếng Anthony Bourdain đã tới quán bún chả trên phố Lê Văn Hưu để thưởng thức món ăn truyền thống này của Việt Nam"),
//   // FoodInfo(
//   //     foodName: "Bánh cuốn",
//   //     foodRef:
//   //         "Thanh Trì có bánh cuốn ngon \n Có gò ngũ Nhạc, có con sông Hồng",
//   //     foodImg: "images/HN_BanhCuon.png",
//   //     foodPrice: "50.000 VNĐ",
//   //     foodFact:
//   //         "Bánh cuốn Việt Nam: Nét tinh tế ẩm thực được khen ngợi nức nở trên báo Mỹ The New York Times")
// ];

// s = '{"name": "Phở", "ref": "Công cha cơm tấm mỡ hành, Nghĩa mẹ như Phở Hà thành Thăng Long", "img": "images/arrow.png", "price": "1.000.000 VNĐ", "fact": "Top 40 món ăn nhất định phải thử trên thế giới"}';
// var tagObjsJson = jsonDecode(temp) as List;
// List<FoodInfo> foods =
//     tagObjsJson.map((tagJson) => FoodInfo.fromJson(tagJson)).toList();