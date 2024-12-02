import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/genres_dto/genres_dto.dart';
import '../dto/popular_movies_dto/popular_movies_dto.dart';
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
  Future<PopularMoviesDTO> getPopular(
    @Query('page') int page,
  );

  @GET('genre/movie/list')
  Future<GenresDTO> getGenres();
}
