class HistoryVid {
  final String avatar;
  final String userName;
  final String videoLink;
  final String videoTitle;

  HistoryVid(this.avatar, this.userName, this.videoLink, this.videoTitle);

  factory HistoryVid.fromJson(dynamic json) {
    return HistoryVid(
      json['avatar'] as String,
      json['user'] as String,
      json['link'] as String,
      json['title'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.avatar}, ${this.userName}, ${this.videoLink}, ${this.videoTitle} }';
  }
}
