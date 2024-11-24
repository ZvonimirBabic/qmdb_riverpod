import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../views/home/home_screen.dart';
import '../views/movie_details/movie_details_screen.dart';
import 'alice_provider.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      errorBuilder: (context, state) => Text('errorBuilder'),
      navigatorKey: ref.watch(aliceProvider).getNavigatorKey(),
      routes: [
        GoRoute(
          path: QMDBRoutes.homeScreen,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: QMDBRoutes.movieDetailsScreen,
          builder: (context, state) => MovieDetailsScreen(),
        ),
      ],
    );
  },
);

class QMDBRoutes {
  static const homeScreen = '/';
  static const movieDetailsScreen = '/movie_details_screen';
}
