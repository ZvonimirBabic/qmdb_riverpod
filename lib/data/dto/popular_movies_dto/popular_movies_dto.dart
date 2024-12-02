import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../popular_movie_dto/popular_movie_dto.dart';

part 'popular_movies_dto.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class PopularMoviesDTO {
  @HiveField(1)
  @JsonKey(name: "page")
  final int page;
  @HiveField(3)
  @JsonKey(name: "results")
  final List<PopularMovieDTO> results;
  @HiveField(5)
  @JsonKey(name: "total_pages")
  final int totalPages;
  @HiveField(7)
  @JsonKey(name: "total_results")
  final int totalResults;

  PopularMoviesDTO({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  PopularMoviesDTO copyWith({
    int? page,
    List<PopularMovieDTO>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      PopularMoviesDTO(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory PopularMoviesDTO.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesDTOToJson(this);
}
