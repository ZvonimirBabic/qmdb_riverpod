import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qmdb/design/constants/app_constants.dart';
import 'package:qmdb/models/movies/movie_basic/movie_basic.dart';

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveServiceImpl();
});

abstract class HiveService {
  Future<void> initHive();
  List<MovieBasic> getFavoriteMoviesFromLocalStorage();
  Future<void> saveFavoriteMovieToLocalStorage(MovieBasic movie);
  Future<void> deleteFavoriteMovieToLocalStorage(MovieBasic movie);
}

class HiveServiceImpl implements HiveService {
  late final Box<MovieBasic> _hiveFavoriteMoviesBox;
  late final Directory cacheDir;

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieBasicAdapter(), override: true);
    _hiveFavoriteMoviesBox =
        await Hive.openBox(QMDBAppConstants.hiveFavouritesBox);
  }

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
