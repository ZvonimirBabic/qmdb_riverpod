import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/base_notifier.dart';
import 'package:qmdb/domain/models/movie/movie.dart';
import 'package:qmdb/services/favorite_movies_notifier.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../shared_widgets/movies/movies_list_item.dart';

class MoviesFavouritesScreen extends ConsumerWidget {
  const MoviesFavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoriteMoviesNotifierProvider);
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
              BaseInitial<List<Movie>>() => throw UnimplementedError(),
              BaseLoading<List<Movie>>() => throw UnimplementedError(),
              BaseError<List<Movie>>() => throw UnimplementedError(),
              BaseData<List<Movie>>() => ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MoviesListItem(
                      movie: state.data[index],
                      isFav: true,
                    );
                  },
                ),
            },
          ),
        ],
      ),
    );
  }
}
