import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'popular_movie_dto.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class PopularMovieDTO {
  @HiveField(0)
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(2)
  @JsonKey(name: "poster_path")
  final String posterPath;
  @HiveField(3)
  @JsonKey(name: "title")
  final String title;
  @HiveField(4)
  @JsonKey(name: "vote_average")
  final double voteAverage;

  PopularMovieDTO({
    required this.genreIds,
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  PopularMovieDTO copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      PopularMovieDTO(
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        posterPath: posterPath ?? this.posterPath,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
      );

  factory PopularMovieDTO.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieDTOFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is PopularMovieDTO && id == other.id && title == other.title;
  }

  Map<String, dynamic> toJson() => _$PopularMovieDTOToJson(this);
}
