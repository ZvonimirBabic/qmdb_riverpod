import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:qmdb/models/movies/movie_basic/movie_basic.dart';

part 'movies_response.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class MoviesResponse {
  @HiveField(1)
  @JsonKey(name: "page")
  final int page;
  @HiveField(3)
  @JsonKey(name: "results")
  final List<MovieBasic> moviesBasicList;
  @HiveField(5)
  @JsonKey(name: "total_pages")
  final int totalPages;
  @HiveField(7)
  @JsonKey(name: "total_results")
  final int totalResults;

  MoviesResponse({
    required this.page,
    required this.moviesBasicList,
    required this.totalPages,
    required this.totalResults,
  });

  MoviesResponse copyWith({
    int? page,
    List<MovieBasic>? moviesBasicList,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviesResponse(
        page: page ?? this.page,
        moviesBasicList: moviesBasicList ?? this.moviesBasicList,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
