import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/dto/genre_dto/genre_dto.dart';
import '../../models/movies/genres/genre.dart';

final genresDTOMapper = Provider.family<Genre, GenreDTO>((ref, genre) {
  return Genre(id: genre.id ?? 0, name: genre.name ?? '');
});
