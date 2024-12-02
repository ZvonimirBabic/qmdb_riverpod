import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/api/alice_provider.dart';
import '../domain/models/movie/movie.dart';
import '../views/home/home_screen.dart';
import '../views/movie_details/movie_details_screen.dart';

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
          name: QMDBRoutes.movieDetailsScreen,
          path: QMDBRoutes.movieDetailsScreen,
          builder: (context, state) {
            final Movie movie = state.extra as Movie;
            return MovieDetailsScreen(
              movie: movie,
            );
          },
        ),
      ],
    );
  },
);

class QMDBRoutes {
  static const homeScreen = '/';
  static const movieDetailsScreen = '/movie_details_screen';
}
