import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qmdb/services/dio_service.dart';
import 'package:qmdb/views/home/home_screen.dart';
import 'package:qmdb/views/movie_details/movie_details_screen.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      errorBuilder: (context, state) => Text('errorBuilder'),
      navigatorKey: ref.read(dioServiceProvider).alice.getNavigatorKey(),
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
