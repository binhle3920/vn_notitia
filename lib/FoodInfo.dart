class FoodInfo {
  final String foodName;
  final String foodRef;
  final String foodImg;
  final String foodPrice;
  final String foodFact;

  FoodInfo({
    this.foodName,
    this.foodRef,
    this.foodImg,
    this.foodPrice,
    this.foodFact,
  });
}

List<FoodInfo> foods = [
  FoodInfo(
      foodName: 'Phở',
      foodRef: "Công cha cơm tấm mỡ hành, Nghĩa mẹ như Phở Hà thành Thăng Long",
      foodImg: "images/HN_Pho.png",
      foodPrice: "1.000.000 VNĐ",
      foodFact: "Top 40 món ăn nhất định phải thử trên thế giới"),
  FoodInfo(
      foodName: "Bún chả",
      foodRef:
          "... Có một ông đồ cuồng chữ ở nhà quê, một hôm khăn gói lên Hà Nội đã ứng khẩu đọc hai câu thơ khi ngửi thấy mùi khó chả: \n Ngàn năm bửu vật đất Thăng Long.\n Bún chả là đây có phải không?...",
      foodImg: "images/HN_BunCha.png",
      foodPrice: "100.000 VNĐ",
      foodFact:
          "Trong chuyến thăm Việt Nam năm 2016, tổng thống Mỹ Barack Obama cùng đầu bếp nổi tiếng Anthony Bourdain đã tới quán bún chả trên phố Lê Văn Hưu để thưởng thức món ăn truyền thống này của Việt Nam"),
  FoodInfo(
      foodName: "Bánh cuốn",
      foodRef:
          "Thanh Trì có bánh cuốn ngon \n Có gò ngũ Nhạc, có con sông Hồng",
      foodImg: "images/HN_BanhCuon.png",
      foodPrice: "50.000 VNĐ",
      foodFact:
          "Bánh cuốn Việt Nam: Nét tinh tế ẩm thực được khen ngợi nức nở trên báo Mỹ The New York Times")
];
