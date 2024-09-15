import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart' hide Response;
import 'package:qmdb/models/movies/movies_response.dart';

import '../models/movies/genres/genre.dart';
import '../models/movies/movie_basic/movie_basic.dart';
import 'api_service.dart';
import 'hive_service.dart';

class MovieService extends GetxService {
  ///
  /// DEPENDENCIES
  ///
  final HiveService hiveService = Get.find();
  final ApiService apiService = Get.find();

  ///
  /// INIT
  ///
  @override
  Future onInit() async {
    await getGenres();
    _favourites.assignAll(
      hiveService.getFavoriteMoviesFromLocalStorage(),
    );
    super.onInit();
  }

  ///
  /// VARIABLES
  ///

  final RxList<MovieBasic> _favourites = <MovieBasic>[].obs;
  final RxList<MovieBasic> _popular = <MovieBasic>[].obs;
  final List<Genre> _genres = <Genre>[];
  int _nextPage = 1;

  ///
  /// METHODS
  ///
  Future<void> getMovies() async {
    final Either<DioException, Response> response =
        await apiService.getPopularMovies(_nextPage);
    response.fold((DioException dioException) {}, (Response response) {
      final MoviesResponse moviesResponse =
          MoviesResponse.fromJson(response.data);
      _popular.addAll(moviesResponse.moviesBasicList);
      _nextPage = moviesResponse.page + 1;
      _popular.refresh();
    });
  }

  Future<void> getGenres() async {
    if (_genres.isEmpty) {
      final Either<DioException, Response> response =
          await apiService.getGenres();
      response.fold((DioException dioException) {}, (Response response) {
        final GenresResponse genresResponse =
            GenresResponse.fromJson(response.data);
        _genres.assignAll(genresResponse.genres);
      });
    }
  }

  Future<Either<DioException, Response>> getMovieDetails(
      {required int movieID}) async {
    return await apiService.getMovieDetails(movieID);
  }

  RxList<MovieBasic> get getMoviesFromRepo => _popular;

  RxList<MovieBasic> get getFavouritesFromRepo {
    return _favourites;
  }

  bool isFavourite(MovieBasic movieBasic) {
    return _favourites.contains(movieBasic);
  }

  void addToFavorites(MovieBasic? movie) {
    if (movie != null) {
      if (_favourites.contains(movie)) {
        _favourites.remove(movie);
        hiveService.deleteFavoriteMovieToLocalStorage(movie);
      } else {
        _favourites.add(movie);
        hiveService.saveFavoriteMovieToLocalStorage(movie);
      }
      _favourites.refresh();
    }
  }

  List<Genre> getGenreListFromIDs(List<int> listOfIDs) {
    final List<Genre> genres = <Genre>[];

    for (int id in listOfIDs) {
      final Genre? genre =
          _genres.firstWhereOrNull((Genre genre) => genre.id == id);
      if (genre != null) {
        genres.add(genre);
      }
    }

    return genres;
  }
}
