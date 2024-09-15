import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qmdb/pages.dart';
import 'package:qmdb/services/api_service.dart';
import 'package:qmdb/services/connectivity_service.dart';
import 'package:qmdb/services/dio_service.dart';
import 'package:qmdb/services/hive_service.dart';
import 'package:qmdb/services/logger_service.dart';
import 'package:qmdb/services/movie_service.dart';

import 'design/theme/app_theme.dart';
import 'locale/locale.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AsyncBinding().dependencies();
  runApp(
    QMDBApp(),
  );
}

class QMDBApp extends StatelessWidget {
  QMDBApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'appName'.tr,
        theme: QMDBThemeLight,
        themeMode: ThemeMode.dark,
        darkTheme: QMDBThemeDark,
        transitionDuration: const Duration(milliseconds: 300),
        navigatorKey: Get.key,

        /// Translation
        locale: Localization.locale,
        translations: Localization(),

        /// Routes
        getPages: pages,
        initialRoute: QMDBRoutes.homeScreen,
        initialBinding: InitialBinding(),
      );
}

class AsyncBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    /// Everything depends on logger
    Get.put(
      LoggerService(),
    );
    await Get.putAsync<HiveService>(
      () async {
        final HiveService service = HiveService();
        await service.initHiveCustom();
        return service;
      },
    );
    await Get.putAsync<DioService>(() => DioService().init(), permanent: true);
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(
        ApiService(),
      )
      ..put(
        MovieService(),
      )
      ..put(
        ConnectivityService(),
      );
  }
}
