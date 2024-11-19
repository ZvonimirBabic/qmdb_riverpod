import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../design/constants/assets.dart';
import '../../../design/constants/colors.dart';
import '../../../shared_widgets/text/label.dart';

class QMDBTabBar extends StatefulWidget {
  const QMDBTabBar({required this.tabController, super.key});
  final TabController tabController;

  Color getColor(int tabIndex) {
    ColorTween selectedColorTween =
        ColorTween(begin: QMDBColors.white, end: QMDBColors.themePrimaryDark);
    ColorTween previousColorTween =
        ColorTween(end: QMDBColors.themePrimaryDark, begin: QMDBColors.white);
    if (tabController.indexIsChanging) {
      final double t = 1.0 - _indexChangeProgress(tabController);
      if (tabController.index == tabIndex) {
        return selectedColorTween.lerp(t)!;
      } else if (tabController.previousIndex == tabIndex) {
        return previousColorTween.lerp(t)!;
      } else {
        return selectedColorTween.begin!;
      }
    } else {
      final double offset = tabController.offset;
      if (tabController.index == tabIndex) {
        return selectedColorTween.lerp(1.0 - offset.abs())!;
      } else if (tabController.index == tabIndex - 1 && offset > 0.0) {
        return selectedColorTween.lerp(offset)!;
      } else if (tabController.index == tabIndex + 1 && offset < 0.0) {
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
  State<QMDBTabBar> createState() => _QMDBTabBarState();
}

class _QMDBTabBarState extends State<QMDBTabBar> {
  @override
  Widget build(BuildContext context) {
    widget.tabController.animation?.addListener(
      () {
        setState(() {});
      },
    );

    return Container(
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      child: TabBar(
        controller: widget.tabController,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        //controller: controller.tabController,
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
                  semanticsLabel: 'Movies',
                  colorFilter:
                      ColorFilter.mode(widget.getColor(0), BlendMode.srcIn),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                QMDBLabelSmall(
                  text: 'Movies',
                  textColor: widget.getColor(0),
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
                  semanticsLabel: 'Favourites',
                  colorFilter:
                      ColorFilter.mode(widget.getColor(1), BlendMode.srcIn),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                QMDBLabelSmall(
                  text: 'Favourites',
                  textColor: widget.getColor(1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
