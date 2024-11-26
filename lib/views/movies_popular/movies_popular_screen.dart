import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/src/domain/notifiers/base_state.dart';
import 'package:qmdb/models/movies/movie_basic_mapped.dart';
import 'package:qmdb/shared_widgets/movies/movies_list_item.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../services/popular_movies_notifier.dart';

class MoviesPopularScreen extends ConsumerWidget {
  const MoviesPopularScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(popularMoviesNotifierProvider);
    log('state in view $state');
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
              BaseInitial<List<MovieBasicMapped>>() =>
                CircularProgressIndicator(),
              BaseLoading<List<MovieBasicMapped>>() =>
                CircularProgressIndicator(),
              BaseError<List<MovieBasicMapped>>() => Text(state.failure.title),
              BaseData<List<MovieBasicMapped>>() => ListView.builder(
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
