import 'package:get/get.dart';
import 'package:show_tv/presentation/ui/movie/movie_imports.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<MovieController>(() => MovieController());
  }
}