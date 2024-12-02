import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';
import 'package:q_architecture/q_architecture.dart';
import 'package:qmdb/domain/mappers/movie_mapper.dart';

import '../data/dto/popular_movie_dto/popular_movie_dto.dart';
import '../domain/models/movie/movie.dart';
import '../domain/movie_repository/movie_repository.dart';

final popularMoviesNotifierProvider =
    NotifierProvider<PopularMoviesNotifier, BaseState<List<Movie>>>(
  () => PopularMoviesNotifier(),
);

class PopularMoviesNotifier extends BaseNotifier<List<Movie>> {
  @override
  void prepareForBuild() {
    fetchMoviesAndParseEntities();
  }

  Future<void> fetchMoviesAndParseEntities() async {
    final Either<Failure, List<PopularMovieDTO>> temp =
        await ref.watch(movieRepositoryProvider).getMovies(1);
    final parsed = temp.fold((fail) {
      state = BaseState.error(
        fail,
      );
    }, (result) {
      state = BaseState.data(result
          .map(
            (a) => ref.read(
              popularMovieDTOMapper(a),
            ),
          )
          .toList(growable: true));
    });
  }
}
