import 'package:get/get.dart' hide Response;
import 'package:qmdb/models/movies/movie_basic/movie_basic.dart';
import 'package:qmdb/services/api_service.dart';
import 'package:qmdb/services/hive_service.dart';
import 'package:qmdb/services/movie_service.dart';

import '../../models/movies/genres/genre.dart';

class MoviesPopularController extends GetxController with StateMixin {
  final ApiService apiService = Get.find();
  final HiveService hiveService = Get.find();
  final MovieService _movieService = Get.find();

  RxList<MovieBasic> get popular => _movieService.getMoviesFromRepo;

  @override
  Future<void> onInit() async {
    getPopularMoviesPage();
    super.onInit();
  }

  Future<void> getPopularMoviesPage() async {
    await _movieService.getMovies();
    change(
      null,
      status: RxStatus.success(),
    );
  }

  List<Genre> getGenres(List<int> ids) {
    return _movieService.getGenreListFromIDs(ids);
  }

  bool isFavorite(MovieBasic movieBasic) {
    return _movieService.isFavourite(movieBasic);
  }

  void addToFavourites(MovieBasic? movie) async {
    _movieService.addToFavorites(movie);
  }
}
