class FeaturePlaylis {
  String? playname;
  String? description;
  String? banner;

  FeaturePlaylis({this.playname, this.description, this.banner});

  factory FeaturePlaylis.FromJSON(Map<String, dynamic> json) {
    return FeaturePlaylis(
      playname: json["name"],
      description: json["description"],
      banner: json["images"][0]["url"],
    );
  }
}
