import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qmdb/design/constants/colors.dart';
import 'package:qmdb/shared_widgets/navigation/appbar.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';
import 'package:qmdb/views/favourites/favourites_screen.dart';
import 'package:qmdb/views/home/home_controller.dart';
import 'package:qmdb/views/home/widgets/tabbar.dart';
import 'package:qmdb/views/movies_popular/movies_popular_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: QMDBAppBar(
          title: Obx(
            () => QMDBHeadlineMedium(
              text: controller.isConnected ? '' : 'noConnection'.tr,
              textColor: QMDBColors.red,
            ),
          ),
        ),
        bottomNavigationBar: const QMDBTabBar(),
        body: TabBarView(
          controller: controller.tabController,
          children: const [
            MoviesPopularScreen(),
            MoviesFavouritesScreen(),
          ],
        ),
      );
}
