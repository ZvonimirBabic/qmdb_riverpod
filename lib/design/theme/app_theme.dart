import 'package:flutter/material.dart';
import 'package:qmdb/design/constants/colors.dart';
import 'package:qmdb/design/theme/text_theme.dart';

final ThemeData QMDBThemeLight = ThemeData();

final ThemeData QMDBThemeDark = ThemeData(
  scaffoldBackgroundColor: QMDBColors.themeBackgroundDark,
  primaryColor: Colors.black,
  textTheme: QMDBTextTheme,
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: QMDBColors.black),
  tabBarTheme: const TabBarTheme(
      labelColor: QMDBColors.themePrimaryDark,
      unselectedLabelColor: QMDBColors.primaryTextColor),
  appBarTheme: const AppBarTheme(
    color: QMDBColors.themeBackgroundDark,
    titleTextStyle: TextStyle(color: QMDBColors.primaryTextColor),
  ),
);
