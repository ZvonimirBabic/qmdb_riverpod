import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart' hide Response;
import 'package:qmdb/models/movies/movie_basic/movie_basic.dart';

import '../../models/movies/genres/genre.dart';
import '../../models/movies/movie_details/movie_details.dart';
import '../../services/movie_service.dart';

class MovieDetailsController extends GetxController with StateMixin {
  final MovieService movieService = Get.find();

  @override
  Future<void> onInit() async {
    await getMovieDetails();
    super.onInit();
  }

  final int movieID = Get.arguments[0];
  final RxBool isFavorite = RxBool(Get.arguments[1]);

  late final Rx<MovieDetails> movieDetails;

  Future<void> getMovieDetails() async {
    await movieService
        .getMovieDetails(movieID: movieID)
        .then((Either<DioException, Response> either) async {
      either.fold((DioException dioException) {
        change(
          null,
          status: RxStatus.error('noConnection'.tr),
        );
      }, (Response response) {
        movieDetails = MovieDetails.fromJson(response.data).obs;
        change(
          null,
          status: RxStatus.success(),
        );
      });
    });
  }

  MovieBasic movieDetailsToMovieBasicMapper(MovieDetails movieDetails) {
    final List<int> genreIDs = <int>[];
    for (Genre genre in movieDetails.genres) {
      genreIDs.add(
        genre.id,
      );
    }
    return MovieBasic(
        genreIds: genreIDs,
        id: movieDetails.id,
        posterPath: movieDetails.posterPath,
        title: movieDetails.title,
        voteAverage: movieDetails.voteAverage);
  }

  void addToFavourites() async {
    movieService.addToFavorites(
      movieDetailsToMovieBasicMapper(movieDetails.value),
    );
    isFavorite.value = !isFavorite.value;
  }
}
