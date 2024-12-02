import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_architecture/src/domain/notifiers/base_state.dart';
import 'package:qmdb/services/favorite_movies_notifier.dart';
import 'package:qmdb/services/go_router_provider.dart';
import 'package:qmdb/shared_widgets/movies/genres_row.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../domain/models/movie/movie.dart';
import '../../models/movies/genres/genre.dart';
import '../../utils/kTransparentImage.dart';
import 'movie_rating_widget.dart';

class MoviesListItem extends ConsumerWidget {
  const MoviesListItem({
    super.key,
    required this.movie,
    this.isFav = false,
  });

  final Movie movie;
  final bool isFav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFavorite =
        ref.watch(favoriteMoviesNotifierProvider.select((state) {
      switch (state) {
        case BaseData(data: final data):
          if (data.contains(movie)) {
            return true;
          } else {
            return false;
          }
        case _:
          return false;
      }
    }));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          ref
              .read(goRouterProvider)
              .pushNamed(QMDBRoutes.movieDetailsScreen, extra: movie);

          ///TODO
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        size: 32,
                        Icons.image_not_supported_outlined,
                        color: Colors.white,
                      ),
                    );
                  },
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original${movie.posterPath ?? ''}'),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: QMDBHeadlineMedium(text: movie.title),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(favoriteMoviesNotifierProvider.notifier)
                              .addToFavorites(movie);
                        },
                        child: isFavorite ?? false
                            ? Icon(
                                Icons.favorite,
                                color: Colors.orange,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.orange,
                              ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  MovieRatingWidget(
                    voteAverage: movie.voteAverage,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GenresRow(
                    genres: List.generate(movie.genres.length, (index) {
                      return Genre(
                          id: movie.genres[index].id,
                          name: movie.genres[index].name);
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
