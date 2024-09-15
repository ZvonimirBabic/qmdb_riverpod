import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'genre.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class Genre {
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(3)
  @JsonKey(name: "name")
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class GenresResponse {
  @JsonKey(name: "genres")
  final List<Genre> genres;

  GenresResponse({
    required this.genres,
  });

  GenresResponse copyWith({
    List<Genre>? genres,
  }) =>
      GenresResponse(
        genres: genres ?? this.genres,
      );

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenresResponseToJson(this);
}
