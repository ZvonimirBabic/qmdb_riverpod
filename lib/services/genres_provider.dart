import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qmdb/models/movies/genres/genre.dart';
import 'package:qmdb/services/movie_repo.dart';

final genresProvider = FutureProvider<List<Genre>>((ref) async {
  List<Genre> genres = [];
  await ref.watch(movieRepositoryProvider).getGenres().fold((failiure) {},
      (data) {
    genres = data;
  });
  return genres;
});
