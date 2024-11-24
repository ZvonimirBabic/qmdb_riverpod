import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/q_architecture.dart';

import '../models/movies/genres/genre.dart';
import '../models/movies/movie_basic/movie_basic.dart';
import 'api_client.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(ref.watch(apiClientProvider));
});

abstract interface class MovieRepository {
  EitherFailureOr<List<MovieBasic>> getMovies(int page);
  EitherFailureOr<List<Genre>> getGenres(int page);
}

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  EitherFailureOr<List<Genre>> getGenres(int page) async {
    try {
      final response = await apiClient.getGenres();
      return Right(response);
    } catch (e, st) {
      return Left(
        Failure(title: 'Failure getGenres', error: e, stackTrace: st),
      );
    }
  }

  @override
  EitherFailureOr<List<MovieBasic>> getMovies(int page) async {
    try {
      final response = await apiClient.getPopular(1);
      return Right(response.moviesBasicList);
    } catch (e, st) {
      return Left(
        Failure(title: 'Failure getMovies', error: e, stackTrace: st),
      );
    }
  }
}
