import 'dart:io';

import 'package:get/get.dart' hide FormData, Response;
import 'package:hive_flutter/adapters.dart';
import 'package:qmdb/design/constants/app_constants.dart';
import 'package:qmdb/models/movies/movie_basic/movie_basic.dart';

class HiveService extends GetxService {
  ///
  /// VARIABLES
  ///

  late final Box<MovieBasic> _hiveFavoriteMoviesBox;
  late final Directory cacheDir;

  ///
  /// INIT
  ///

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> initHiveCustom() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      MovieBasicAdapter(),
    );
    _hiveFavoriteMoviesBox =
        await Hive.openBox(QMDBAppConstants.hiveFavouritesBox);
  }

  ///
  /// METHODS
  ///

  List<MovieBasic> getFavoriteMoviesFromLocalStorage() {
    return _hiveFavoriteMoviesBox.values.toList();
  }

  Future<void> saveFavoriteMovieToLocalStorage(MovieBasic movie) async {
    _hiveFavoriteMoviesBox.put(movie.id, movie);
  }

  Future<void> deleteFavoriteMovieToLocalStorage(MovieBasic movie) async {
    _hiveFavoriteMoviesBox.delete(movie.id);
  }
}
