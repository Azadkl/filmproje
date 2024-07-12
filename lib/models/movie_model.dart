class MovieModel {
  final String title;
  final int year;
  final String imdbCode;
  final String poster;
  final double rating;

  MovieModel(
      {required this.title,
      required this.year,
      required this.imdbCode,
      required this.poster,
      required this.rating});
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json['title'],
        year: json['year'],
        imdbCode: json['imdb_code'],
        poster: json['medium_cover_image'],
        rating: (json['rating'] as num).toDouble());
  }
}
