import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'genres/genre.dart';

part 'movie_basic_mapped.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class MovieBasicMapped {
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

  MovieBasicMapped({
    required this.genres,
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  MovieBasicMapped copyWith({
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
      MovieBasicMapped(
        genres: genres ?? this.genres,
        id: id ?? this.id,
        posterPath: posterPath ?? this.posterPath,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
      );

  factory MovieBasicMapped.fromJson(Map<String, dynamic> json) =>
      _$MovieBasicMappedFromJson(json);

  @override
  bool operator ==(Object other) {
    return other is MovieBasicMapped && id == other.id && title == other.title;
  }

  Map<String, dynamic> toJson() => _$MovieBasicMappedToJson(this);
}
