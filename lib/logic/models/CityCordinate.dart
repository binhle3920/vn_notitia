class CityCordinate {
    final String city;
    final int top, left;

    CityCordinate(this.city, this.top, this.left);

    factory CityCordinate.fromJson(dynamic json) {
        return CityCordinate(
                json['name'] as String,
                json['top'] as int,
                json['left'] as int
                );
    }
}
