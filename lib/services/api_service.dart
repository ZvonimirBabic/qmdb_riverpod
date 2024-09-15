import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:qmdb/services/dio_service.dart';
import 'package:qmdb/utils/util_constants/qmdb_urls.dart';

class ApiService extends GetxService {
  final DioService dioService = Get.find();

  ///
  /// METHODS
  ///

  Future<Either<DioException, Response>> getPopularMovies(int? page) async {
    page ??= 1;
    final Either<DioException, Response> response = await dioService.request(
      endpoint: QMDBUrls.getPopularMovies + page.toString(),
      httpMethod: HttpMethod.get,
    );
    return response;
  }

  Future<Either<DioException, Response>> getMovieDetails(int movieID) async {
    final Either<DioException, Response> response = await dioService.request(
      endpoint: QMDBUrls.getMovieDetails + movieID.toString(),
      httpMethod: HttpMethod.get,
    );
    return response;
  }

  Future<Either<DioException, Response>> getGenres() async {
    final Either<DioException, Response> response = await dioService.request(
      endpoint: QMDBUrls.getGenres,
      httpMethod: HttpMethod.get,
    );
    return response;
  }
}
