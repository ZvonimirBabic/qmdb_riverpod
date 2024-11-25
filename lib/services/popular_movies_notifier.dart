import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';
import 'package:q_architecture/q_architecture.dart';

import '../models/movies/movie_basic/movie_basic.dart';

final popularMoviesNotifierProvider =
    NotifierProvider<PopularMoviesNotifier, BaseState<List<MovieBasic>>>(
  () => PopularMoviesNotifier(),
);

class PopularMoviesNotifier extends BaseNotifier<List<MovieBasic>> {
  @override
  void prepareForBuild() {
    fetchMoviesAndParseEntities();
  }

  Future<void> fetchMoviesAndParseEntities() async {
    await Future.delayed(
      Duration(microseconds: 300),
    );
    state = BaseState.error(
      Failure(title: 'not implemented'),
    );
  }
}
