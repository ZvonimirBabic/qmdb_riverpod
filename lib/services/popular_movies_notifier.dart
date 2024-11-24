import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';

import '../models/movies/movie_basic/movie_basic.dart';

final popularMoviesNotifierProvider =
    NotifierProvider<PopularMoviesNotifier, BaseState<List<MovieBasic>>>(
  () => PopularMoviesNotifier(),
);

class PopularMoviesNotifier extends BaseNotifier<List<MovieBasic>> {
  @override
  void prepareForBuild() {
    /// Load data from movie repository and create a list
  }
}
