import 'package:get/get.dart';
import 'package:qmdb/views/home/home_binding.dart';
import 'package:qmdb/views/home/home_screen.dart';
import 'package:qmdb/views/movie_details/movie_details_binding.dart';
import 'package:qmdb/views/movie_details/movie_details_screen.dart';

final pages = [
  GetPage(
    name: QMDBRoutes.homeScreen,
    page: HomeScreen.new,
    binding: HomeBinding(),
  ),
  GetPage(
      name: QMDBRoutes.movieDetailsScreen,
      page: MovieDetailsScreen.new,
      binding: MovieDetailsBinding(),
      transition: Transition.circularReveal),
];

class QMDBRoutes {
  static const homeScreen = '/home_screen';
  static const movieDetailsScreen = '/movie_details_screen';
}
