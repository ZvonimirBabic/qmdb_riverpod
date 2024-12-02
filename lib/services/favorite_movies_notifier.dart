import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';

import '../domain/models/movie/movie.dart';

final favoriteMoviesNotifierProvider =
    NotifierProvider<FavoriteMoviesNotifier, BaseState<List<Movie>>>(
  () => FavoriteMoviesNotifier(),
);

class FavoriteMoviesNotifier extends BaseNotifier<List<Movie>> {
  @override
  void prepareForBuild() {
    getFavorites();
  }

  Future<void> getFavorites() async {
    await Future.delayed(Duration(milliseconds: 300));

    /// get favorites from hive
    state = BaseState.data([]);
  }

  void addToFavorites(Movie movie) {
    switch (state) {
      case BaseInitial():
        break;
      case BaseLoading():
        break;
      case BaseError():
        break;
      case BaseData(data: final data):
        if (data.contains(movie)) {
          state = BaseState.data(List.from(data)..remove(movie));
        } else {
          state = BaseState.data(List.from(data)..add(movie));
        }
        break;
    }

    /// add or remove a movie from hive
  }
}
