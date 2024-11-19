import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qmdb/design/constants/app_constants.dart';
import 'package:qmdb/models/movies/movie_basic/movie_basic.dart';

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});

class HiveService {
  ///
  /// VARIABLES
  ///

  late final Box<MovieBasic> _hiveFavoriteMoviesBox;
  late final Directory cacheDir;

  ///
  /// INIT
  ///

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
