class moviesModel {
  String title;
  String release_date;
  String og_lang;
  double ratings;
  int ratings_count;
  String overview;
  String poster_path;

  moviesModel({
    required this.title,
    required this.release_date,
    required this.og_lang,
    required this.ratings,
    required this.ratings_count,
    required this.overview,
    required this.poster_path,
  });

  factory moviesModel.fromJson(Map<String, dynamic> json) {
    return moviesModel(
        title: json['title'],
        release_date: json['release_date'],
        og_lang: json['original_language'],
        ratings: json['vote_average'].toDouble(),
        ratings_count: json['vote_count'],
        overview: json['overview'],
        poster_path: json['poster_path']);
  }
}
