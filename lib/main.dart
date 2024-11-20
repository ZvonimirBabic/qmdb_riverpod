import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qmdb/pages.dart';
import 'package:qmdb/services/dio_service.dart';
import 'package:qmdb/services/hive_service.dart';

import 'design/theme/app_theme.dart';

final appStartupProvider = FutureProvider(
  name: 'appStartupProvider',
  (ref) async {
    await ref.watch(dioServiceProvider).init();
    await ref.watch(hiveServiceProvider).initHiveCustom();
  },
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: QMDBApp(),
    ),
  );
}

class QMDBApp extends ConsumerWidget {
  QMDBApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    final GoRouter goRouter = ref.watch(goRouterProvider);
    return appStartupState.when(
      loading: () => const SizedBox(),
      error: (error, stackTrace) => MaterialApp(
        home: Scaffold(
          body: Center(child: Text(error.toString())),
        ),
      ),
      data: (_) {
        return MaterialApp.router(
          title: 'appName',
          theme: QMDBThemeLight,
          themeMode: ThemeMode.dark,
          darkTheme: QMDBThemeDark,
          routerDelegate: goRouter.routerDelegate,
          routeInformationProvider: goRouter.routeInformationProvider,
          routeInformationParser: goRouter.routeInformationParser,
          builder: (BuildContext context, Widget? child) {
            return child ?? Offstage();
          },
        );
      },
    );
  }
}
