import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qmdb/design/constants/app_constants.dart';

import '../data/dto/popular_movie_dto/popular_movie_dto.dart';

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveServiceImpl();
});

abstract class HiveService {
  Future<void> initHive();
  List<PopularMovieDTO> getFavoriteMoviesFromLocalStorage();
  Future<void> saveFavoriteMovieToLocalStorage(PopularMovieDTO movie);
  Future<void> deleteFavoriteMovieToLocalStorage(PopularMovieDTO movie);
}

class HiveServiceImpl implements HiveService {
  late final Box<PopularMovieDTO> _hiveFavoriteMoviesBox;
  late final Directory cacheDir;

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PopularMovieDTOAdapter(), override: true);
    _hiveFavoriteMoviesBox =
        await Hive.openBox(QMDBAppConstants.hiveFavouritesBox);
  }

  List<PopularMovieDTO> getFavoriteMoviesFromLocalStorage() {
    return _hiveFavoriteMoviesBox.values.toList();
  }

  Future<void> saveFavoriteMovieToLocalStorage(PopularMovieDTO movie) async {
    _hiveFavoriteMoviesBox.put(movie.id, movie);
  }

  Future<void> deleteFavoriteMovieToLocalStorage(PopularMovieDTO movie) async {
    _hiveFavoriteMoviesBox.delete(movie.id);
  }
}
