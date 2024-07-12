import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie_model.dart';

class MovieService {
  final String _baseUrl = 'https://yts.mx/api/v2/';

  Future<List<MovieModel>> fetchMovies(String query) async {
    final response = await http
        .get(Uri.parse('${_baseUrl}list_movies.json?query_term=$query'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      List movies = body['data']['movies'];
      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Fİlmler yüklenemedi');
    }
  }
}
