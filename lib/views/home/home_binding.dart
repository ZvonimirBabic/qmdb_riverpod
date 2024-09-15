import 'package:get/get.dart';
import 'package:qmdb/views/movies_popular/movies_popular_controller.dart';

import '../favourites/movies_favourites_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomeController.new);
    Get.lazyPut(MoviesPopularController.new);
    Get.lazyPut(MoviesFavouritesController.new);
  }
}
