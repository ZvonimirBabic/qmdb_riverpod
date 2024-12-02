import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/src/domain/notifiers/base_state.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../domain/models/movie/movie.dart';
import '../../services/popular_movies_notifier.dart';
import '../../shared_widgets/movies/movies_list_item.dart';

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
              child: Center(
            child: switch (state) {
              BaseInitial<List<Movie>>() => CircularProgressIndicator(),
              BaseLoading<List<Movie>>() => CircularProgressIndicator(),
              BaseError<List<Movie>>() => Text(state.failure.title),
              BaseData<List<Movie>>() => ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MoviesListItem(
                      movie: state.data[index],
                    );
                  },
                ),
            },
          )),
        ],
      ),
    );
  }
}
