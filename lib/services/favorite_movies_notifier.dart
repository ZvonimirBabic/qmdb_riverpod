import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';

import '../models/movies/movie_basic/movie_basic.dart';

final favoriteMoviesNotifierProvider =
    NotifierProvider<FavoriteMoviesNotifier, BaseState<List<MovieBasic>>>(
  () => FavoriteMoviesNotifier(),
);

class FavoriteMoviesNotifier extends BaseNotifier<List<MovieBasic>> {
  @override
  void prepareForBuild() {
    /// Load data from hive and create a list
  }
}
