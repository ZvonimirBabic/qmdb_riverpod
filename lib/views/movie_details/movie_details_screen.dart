import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qmdb/design/constants/colors.dart';
import 'package:qmdb/shared_widgets/movies/genres_row.dart';
import 'package:qmdb/shared_widgets/movies/movie_rating_widget.dart';
import 'package:qmdb/shared_widgets/text/body.dart';

import '../../../utils/kTransparentImage.dart';
import '../../design/constants/assets.dart';
import '../../shared_widgets/text/headline.dart';
import 'movie_details_controller.dart';

class MovieDetailsScreen extends GetView<MovieDetailsController> {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: controller.obx(
            (state) => Stack(
                  children: [
                    Container(
                      height: double.infinity,
                    ),
                    Container(
                      height: context.height * 0.33,
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
                            'https://image.tmdb.org/t/p/original${controller.movieDetails.value.posterPath ?? ''}'),
                      ),
                    ),
                    Positioned.fill(
                      top: context.height * 0.30,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Get.theme.scaffoldBackgroundColor,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  QMDBHeadlineLarge(
                                      text:
                                          controller.movieDetails.value.title),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: controller.addToFavourites,
                                      child: controller.isFavorite.value
                                          ? SvgPicture.asset(
                                              QMDBAssets
                                                  .favouritesIconCheckedFillSVG,
                                              semanticsLabel: 'Favorite icon')
                                          : SvgPicture.asset(
                                              QMDBAssets
                                                  .favouritesIconUncheckedSVG,
                                              semanticsLabel:
                                                  'Not favorite icon'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              MovieRatingWidget(
                                  voteAverage: controller
                                      .movieDetails.value.voteAverage),
                              const SizedBox(
                                height: 16,
                              ),
                              GenresRow(
                                genres: controller.movieDetails.value.genres,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              QMDBHeadlineMedium(text: 'description'.tr),
                              const SizedBox(
                                height: 40,
                              ),
                              Expanded(
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    child: QMDBBodyMedium(
                                      text: controller
                                          .movieDetails.value.overview,
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
                        onTap: Get.back,
                        child: const Icon(
                          Icons.arrow_back,
                          color: QMDBColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ), onError: (String? error) {
          return Center(
            child: QMDBHeadlineMedium(
              text: error,
            ),
          );
        }),
      ),
    );
  }
}
