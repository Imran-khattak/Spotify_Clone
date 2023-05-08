class AtristProfile {
  String? name;

  String? image_url;

  AtristProfile({this.name, this.image_url});

  factory AtristProfile.fromJSON(Map<String, dynamic> json) {
    return AtristProfile(
      name: json["name"] as String,
      image_url: json["images"][0]["url"],
    );
  }
}
