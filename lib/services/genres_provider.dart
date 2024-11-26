import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qmdb/models/movies/genres/genre.dart';

final genresStateProvider = StateProvider<List<Genre>>((ref) {
  return [];
});
