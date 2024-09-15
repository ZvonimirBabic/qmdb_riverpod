import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qmdb/views/home/home_controller.dart';

import '../../../design/constants/assets.dart';
import '../../../design/constants/colors.dart';
import '../../../shared_widgets/text/label.dart';

class QMDBTabBar extends GetWidget<HomeController> {
  const QMDBTabBar({super.key});

  Color getColor(int tabIndex) {
    ColorTween selectedColorTween =
        ColorTween(begin: QMDBColors.white, end: QMDBColors.themePrimaryDark);
    ColorTween previousColorTween =
        ColorTween(end: QMDBColors.themePrimaryDark, begin: QMDBColors.white);
    if (controller.tabController.indexIsChanging) {
      final double t = 1.0 - _indexChangeProgress(controller.tabController);
      if (controller.tabController.index == tabIndex) {
        return selectedColorTween.lerp(t)!;
      } else if (controller.tabController.previousIndex == tabIndex) {
        return previousColorTween.lerp(t)!;
      } else {
        return selectedColorTween.begin!;
      }
    } else {
      final double offset = controller.tabController.offset;
      if (controller.tabController.index == tabIndex) {
        return selectedColorTween.lerp(1.0 - offset.abs())!;
      } else if (controller.tabController.index == tabIndex - 1 &&
          offset > 0.0) {
        return selectedColorTween.lerp(offset)!;
      } else if (controller.tabController.index == tabIndex + 1 &&
          offset < 0.0) {
        return selectedColorTween.lerp(-offset)!;
      } else {
        return selectedColorTween.begin!;
      }
    }
  }

  double _indexChangeProgress(TabController controller) {
    final double controllerValue = controller.animation!.value;
    final double previousIndex = controller.previousIndex.toDouble();
    final double currentIndex = controller.index.toDouble();
    if (!controller.indexIsChanging) {
      return clampDouble((currentIndex - controllerValue).abs(), 0.0, 1.0);
    }
    return (controllerValue - currentIndex).abs() /
        (currentIndex - previousIndex).abs();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'tabBarBuilder',
        builder: (homeController) {
          return Container(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            child: TabBar(
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              controller: controller.tabController,
              indicator: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: QMDBColors.themePrimaryDark, width: 2),
                ),
              ),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        QMDBAssets.moviesIconSVG,
                        width: 28,
                        height: 28,
                        semanticsLabel: 'movies'.tr,
                        colorFilter:
                            ColorFilter.mode(getColor(0), BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      QMDBLabelSmall(
                        text: 'movies'.tr,
                        textColor: getColor(0),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        QMDBAssets.favouritesIconCheckedSVG,
                        width: 28,
                        height: 28,
                        semanticsLabel: 'favourites'.tr,
                        colorFilter:
                            ColorFilter.mode(getColor(1), BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      QMDBLabelSmall(
                        text: 'favourites'.tr,
                        textColor: getColor(1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
