class Movie {
  final String? title;
  final String? posteUrl;

  Movie({this.title, this.posteUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      posteUrl: json["poster"]
    );
  }
}
