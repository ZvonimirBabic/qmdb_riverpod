import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qmdb/data/dto/popular_movie_dto/popular_movie_dto.dart';

import '../../models/movies/genres/genre.dart';
import '../../services/genres_provider.dart';
import '../models/movie/movie.dart';

final popularMovieDTOMapper =
    Provider.family<Movie, PopularMovieDTO>((ref, movieBasic) {
  final genres = ref.watch(genresStateProvider);

  Genre findGenre(int id) {
    return genres.firstWhere((e) => e.id == id);
  }

  return Movie(
      genres: movieBasic.genreIds.map((id) => findGenre(id)).toList(),
      id: movieBasic.id,
      posterPath: movieBasic.posterPath,
      title: movieBasic.title,
      voteAverage: movieBasic.voteAverage);
});
