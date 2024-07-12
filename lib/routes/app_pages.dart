import 'package:filmproje/bindings/movie_binding.dart';
import 'package:filmproje/views/movie_view.dart';
import 'package:filmproje/views/splash.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => MovieView(),
        binding: MovieBinding(),
        children: [
          GetPage(
            name: _Paths.SPLASH,
            page: () => Splash(),
          )
        ]),
  ];
}
