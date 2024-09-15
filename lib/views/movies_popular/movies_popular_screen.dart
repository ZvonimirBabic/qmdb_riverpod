import 'package:easy_infinite_pagination/easy_infinite_pagination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

import '../../shared_widgets/movies/movies_list_item.dart';
import 'movies_popular_controller.dart';

class MoviesPopularScreen extends GetViewKeepAlive<MoviesPopularController> {
  const MoviesPopularScreen({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            QMDBHeadlineLarge(text: 'popular'.tr),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: controller.obx(
                (state) => InfiniteListView(
                  delegate: PaginationDelegate(
                    itemCount: controller.popular.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(
                        () => MoviesListItem(
                          genres: controller
                              .getGenres(controller.popular[index].genreIds),
                          movie: controller.popular[index],
                          isFavorite:
                              controller.isFavorite(controller.popular[index]),
                          addToFavorites: () {
                            controller
                                .addToFavourites(controller.popular[index]);
                          },
                        ),
                      );
                    },
                    fetchDataOnStart: false,
                    onFetchData: controller.getPopularMoviesPage,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}

abstract class GetViewKeepAlive<T> extends StatefulWidget {
  const GetViewKeepAlive({super.key, this.tag});

  @override
  State<GetViewKeepAlive<T>> createState() => _GetViewKeepAliveState<T>();

  @protected
  Widget build(BuildContext context);

  @protected
  final String? tag;

  @protected
  T get controller => GetInstance().find<T>(tag: tag)!;
}

class _GetViewKeepAliveState<T> extends State<GetViewKeepAlive<T>>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}
