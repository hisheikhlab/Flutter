class Movie {
  String title;
  String poster;
  String overview;
  double rating;
  String releasedate;
  int reviews;

  Movie({
    required this.title,
    required this.poster,
    required this.overview,
    required this.rating,
    required this.releasedate,
    required this.reviews,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        poster: json["poster_path"],
        overview: json["overview"],
        rating: json["vote_average"],
        releasedate: json["release_date"],
        reviews: json["vote_count"]);
  }
}
