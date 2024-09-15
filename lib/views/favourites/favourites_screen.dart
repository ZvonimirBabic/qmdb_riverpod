import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../shared_widgets/movies/movies_list_item.dart';
import 'movies_favourites_controller.dart';

class MoviesFavouritesScreen extends GetView<MoviesFavouritesController> {
  const MoviesFavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            QMDBHeadlineLarge(text: 'favourites'.tr),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: controller.getFavouritesFromRepo.isEmpty
                  ? Center(
                      child: QMDBHeadlineLarge(
                        text: 'noElements'.tr,
                      ),
                    )
                  : Obx(
                      () => ListView.builder(
                        itemCount: controller.getFavouritesFromRepo.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MoviesListItem(
                            movie: controller.getFavouritesFromRepo[index],
                            isFavorite: true,
                            addToFavorites: () {
                              controller.addToFavourites(
                                  controller.getFavouritesFromRepo[index]);
                            },
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      );
}
