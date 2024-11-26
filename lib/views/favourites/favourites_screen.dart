import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../models/movies/movie_basic_mapped.dart';
import '../../services/popular_movies_notifier.dart';

class MoviesFavouritesScreen extends ConsumerWidget {
  const MoviesFavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(popularMoviesNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          QMDBHeadlineLarge(text: 'Favourites'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: switch (state) {
              BaseInitial<List<MovieBasicMapped>>() =>
                throw UnimplementedError(),
              BaseLoading<List<MovieBasicMapped>>() =>
                throw UnimplementedError(),
              BaseError<List<MovieBasicMapped>>() => throw UnimplementedError(),
              BaseData<List<MovieBasicMapped>>() => throw UnimplementedError(),
            },
          ),
        ],
      ),
    );
  }
}
