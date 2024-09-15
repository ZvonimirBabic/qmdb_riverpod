// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsAdapter extends TypeAdapter<MovieDetails> {
  @override
  final int typeId = 3;

  @override
  MovieDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetails(
      genres: (fields[0] as List).cast<Genre>(),
      id: fields[1] as int,
      overview: fields[2] as String,
      posterPath: fields[3] as String,
      title: fields[4] as String,
      voteAverage: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetails obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.genres)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num).toInt(),
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'id': instance.id,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
