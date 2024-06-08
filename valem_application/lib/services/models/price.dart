class Price {
  final String userid;
  final num entranceprice;
  final num hourlyprice;
  Price({
    this.userid = "",
    required this.entranceprice,
    required this.hourlyprice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      userid: json['userid'],
      entranceprice: json['entranceprice'],
      hourlyprice: json['hourlyprice'],
    );
  }
}
