class ToModel {
  String? songname;

  String? songbanner;

  ToModel({this.songname, this.songbanner});

  factory ToModel.FromJSON(Map<String, dynamic> json) {
    return ToModel(
      songname: json["name"],
      songbanner: json["images"][0]["url"],
    );
  }
}
