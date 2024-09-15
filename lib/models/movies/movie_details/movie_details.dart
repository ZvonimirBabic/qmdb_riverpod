import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../genres/genre.dart';

part 'movie_details.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class MovieDetails {
  @HiveField(0)
  @JsonKey(name: "genres")
  final List<Genre> genres;
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(2)
  @JsonKey(name: "overview")
  final String overview;
  @HiveField(3)
  @JsonKey(name: "poster_path")
  final String posterPath;
  @HiveField(4)
  @JsonKey(name: "title")
  final String title;
  @HiveField(5)
  @JsonKey(name: "vote_average")
  final double voteAverage;

  MovieDetails({
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  MovieDetails copyWith({
    List<Genre>? genres,
    int? id,
    String? overview,
    String? posterPath,
    String? title,
    double? voteAverage,
  }) =>
      MovieDetails(
        genres: genres ?? this.genres,
        id: id ?? this.id,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
      );

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
