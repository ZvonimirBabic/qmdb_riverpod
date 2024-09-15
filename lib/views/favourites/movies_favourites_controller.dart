import 'package:get/get.dart';

import '../../models/movies/movie_basic/movie_basic.dart';
import '../../services/movie_service.dart';

class MoviesFavouritesController extends GetxController {
  final MovieService _movieService = Get.find();

  get getFavouritesFromRepo => _movieService.getFavouritesFromRepo;

  void addToFavourites(MovieBasic? movie) async {
    _movieService.addToFavorites(movie);
  }
}
