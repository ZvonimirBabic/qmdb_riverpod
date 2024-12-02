import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qmdb/data/api/dio_provider.dart';
import 'package:qmdb/services/go_router_provider.dart';
import 'package:qmdb/services/hive_service.dart';

import 'design/theme/app_theme.dart';

final appStartupProvider = FutureProvider(
  name: 'appStartupProvider',
  (ref) async {
    /// Kad stavim ref.watch onda se inicijalizira dvaput i baci late already initialized
    await ref.read(dioCacheInterceptorProvider);
    await ref.read(hiveServiceProvider).initHive();
  },
);

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
      error: (error, stackTrace) {
        FlutterNativeSplash.remove();
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text(
                error.toString(),
              ),
            ),
          ),
        );
      },
      data: (_) {
        FlutterNativeSplash.remove();
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

/// TODO
/// convert dio service to only provide dio without extra methods
/// create an api client that uses dio and generate with retrofit
///
