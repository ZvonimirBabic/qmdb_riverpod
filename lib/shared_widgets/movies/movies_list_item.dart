import 'package:flutter/material.dart';
import 'package:qmdb/shared_widgets/movies/genres_row.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../models/movies/genres/genre.dart';
import '../../models/movies/movie_basic_mapped.dart';
import '../../utils/kTransparentImage.dart';
import 'movie_rating_widget.dart';

class MoviesListItem extends StatelessWidget {
  const MoviesListItem({
    super.key,
    required this.movie,
    this.addToFavorites,
    this.isFavorite = false,
  });

  final MovieBasicMapped movie;
  final VoidCallback? addToFavorites;

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
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
                        onTap: addToFavorites,
                        child: isFavorite
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_outlined),
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
