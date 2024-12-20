import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qmdb/design/constants/colors.dart';
import 'package:qmdb/shared_widgets/movies/genres_row.dart';
import 'package:qmdb/shared_widgets/movies/movie_rating_widget.dart';
import 'package:qmdb/shared_widgets/text/body.dart';

import '../../../utils/kTransparentImage.dart';
import '../../design/constants/assets.dart';
import '../../domain/models/movie/movie.dart';
import '../../shared_widgets/text/headline.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                ),
                Container(
                  height: constraints.maxHeight * 0.33,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: FadeInImage(
                    fit: BoxFit.fitWidth,
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
                Positioned.fill(
                  top: constraints.maxHeight * 0.30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 28.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QMDBHeadlineLarge(text: movie.title),
                              GestureDetector(
                                onTap: () {},
                                child: true
                                    ? SvgPicture.asset(
                                        QMDBAssets.favouritesIconCheckedFillSVG,
                                        semanticsLabel: 'Favorite icon')
                                    : SvgPicture.asset(
                                        QMDBAssets.favouritesIconUncheckedSVG,
                                        semanticsLabel: 'Not favorite icon'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MovieRatingWidget(voteAverage: movie.voteAverage),
                          const SizedBox(
                            height: 16,
                          ),
                          GenresRow(
                            genres: movie.genres,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          QMDBHeadlineMedium(text: 'Description'),
                          const SizedBox(
                            height: 40,
                          ),
                          Expanded(
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: QMDBBodyMedium(
                                  text: 'Forgot to add data to model',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back,
                      color: QMDBColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
