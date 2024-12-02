import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../models/movies/genres/genre.dart';

part 'movie.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Movie {
  @HiveField(0)
  @JsonKey(name: "genres")
  final List<Genre> genres;
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

  Movie({
    required this.genres,
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    List<Genre>? genres,
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
      Movie(
        genres: genres ?? this.genres,
        id: id ?? this.id,
        posterPath: posterPath ?? this.posterPath,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
      );

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is Movie && id == other.id && title == other.title;
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
