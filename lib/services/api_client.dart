import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qmdb/models/movies/movies_response.dart';
import 'package:retrofit/retrofit.dart';

import '../models/movies/genres/genre.dart';
import 'dio_provider.dart';

part 'api_client.g.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(
      dioProvider,
    ),
  ),
);

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/movie/popular')
  Future<MoviesResponse> getPopular(
    @Query('page') int page,
  );

  @GET('genre/movie/list')
  Future<List<Genre>> getGenres();
}