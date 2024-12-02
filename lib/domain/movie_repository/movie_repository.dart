import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/q_architecture.dart';
import 'package:qmdb/data/dto/genre_dto/genre_dto.dart';
import 'package:qmdb/domain/mappers/genres_mapper.dart';
import 'package:qmdb/services/genres_provider.dart';

import '../../data/api/api_client.dart';
import '../../data/dto/popular_movie_dto/popular_movie_dto.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(ref, ref.watch(apiClientProvider));
});

abstract interface class MovieRepository {
  EitherFailureOr<List<PopularMovieDTO>> getMovies(int page);
  EitherFailureOr<List<GenreDTO>?> getGenres();
}

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this.ref, this.apiClient);

  final Ref ref;
  final ApiClient apiClient;

  @override
  EitherFailureOr<List<GenreDTO>?> getGenres() async {
    try {
      final response = await apiClient.getGenres();
      return Right(response.genres);
    } catch (e, st) {
      return Left(
        Failure(title: 'Failure getGenres', error: e, stackTrace: st),
      );
    }
  }

  @override
  EitherFailureOr<List<PopularMovieDTO>> getMovies(int page) async {
    if (true) {
      await getGenres().fold(
        (fail) {
          log(fail.title);
        },
        (result) {
          if (result != null) {
            ref.read(genresStateProvider.notifier).state = result
                .map(
                  (a) => ref.read(
                    genresDTOMapper(a),
                  ),
                )
                .toList(growable: true);
          }
        },
      );
    }
    try {
      final response = await apiClient.getPopular(1);
      return Right(response.results);
    } catch (e, st) {
      return Left(
        Failure(title: 'Failure getMovies', error: e, stackTrace: st),
      );
    }
  }
}
