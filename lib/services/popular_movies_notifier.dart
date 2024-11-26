import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';
import 'package:q_architecture/q_architecture.dart';
import 'package:qmdb/models/movies/genres/genre.dart';
import 'package:qmdb/services/genres_provider.dart';
import 'package:qmdb/services/movie_repo.dart';

import '../models/movies/movie_basic/movie_basic.dart';
import '../models/movies/movie_basic_mapped.dart';

final popularMoviesNotifierProvider =
    NotifierProvider<PopularMoviesNotifier, BaseState<List<MovieBasicMapped>>>(
  () => PopularMoviesNotifier(),
);

class PopularMoviesNotifier extends BaseNotifier<List<MovieBasicMapped>> {
  @override
  void prepareForBuild() {
    fetchMoviesAndParseEntities();
  }

  Future<void> fetchMoviesAndParseEntities() async {
    final Either<Failure, List<MovieBasic>> temp =
        await ref.watch(movieRepositoryProvider).getMovies(1);
    final parsed = temp.fold((fail) {
      state = BaseState.error(
        fail,
      );
    }, (result) {
      state = BaseState.data(result
          .map(
            (a) => ref.read(
              movieBasicMapperProvider(a),
            ),
          )
          .toList(growable: true));
    });
  }
}

final movieBasicMapperProvider =
    Provider.family<MovieBasicMapped, MovieBasic>((ref, movieBasic) {
  final genres = ref.watch(genresStateProvider);

  Genre findGenre(int id) {
    return genres.firstWhere((e) => e.id == id);
  }

  return MovieBasicMapped(
      genres: movieBasic.genreIds.map((id) => findGenre(id)).toList(),
      id: movieBasic.id,
      posterPath: movieBasic.posterPath,
      title: movieBasic.title,
      voteAverage: movieBasic.voteAverage);
});
