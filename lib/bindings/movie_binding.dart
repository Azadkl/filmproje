import 'package:filmproje/controllers/movie_controller.dart';
import 'package:filmproje/services/movie_service.dart';
import 'package:get/get.dart';



class MovieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController(MovieService()));
  }
}
