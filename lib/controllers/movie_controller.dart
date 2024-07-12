import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';

class MovieController extends GetxController {
  MovieController(this.movieService);
  MovieService movieService;

  var isLoading = true.obs;
  final TextEditingController searchController = TextEditingController();
  var movieList = <MovieModel>[].obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var movies = await MovieService().fetchMovies(searchController.text);
      if (movies != null) {
        movieList.assignAll(movies);
      }
    } finally {
      isLoading(false);
    }
    update();
  }
}
