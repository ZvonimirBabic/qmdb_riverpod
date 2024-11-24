import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/src/domain/notifiers/base_state.dart';
import 'package:qmdb/models/movies/movie_basic/movie_basic.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../services/popular_movies_notifier.dart';

class MoviesPopularScreen extends ConsumerWidget {
  const MoviesPopularScreen({super.key});

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
          QMDBHeadlineLarge(text: 'Popular'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: switch (state) {
              BaseInitial<List<MovieBasic>>() => throw UnimplementedError(),
              BaseLoading<List<MovieBasic>>() => throw UnimplementedError(),
              BaseError<List<MovieBasic>>() => throw UnimplementedError(),
              BaseData<List<MovieBasic>>() => throw UnimplementedError(),
            },
          ),
        ],
      ),
    );
  }
}
