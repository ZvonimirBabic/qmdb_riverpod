// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_basic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieBasicAdapter extends TypeAdapter<MovieBasic> {
  @override
  final int typeId = 2;

  @override
  MovieBasic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieBasic(
      genreIds: (fields[0] as List).cast<int>(),
      id: fields[1] as int,
      posterPath: fields[2] as String,
      title: fields[3] as String,
      voteAverage: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MovieBasic obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.genreIds)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieBasicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieBasic _$MovieBasicFromJson(Map<String, dynamic> json) => MovieBasic(
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      posterPath: json['poster_path'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieBasicToJson(MovieBasic instance) =>
    <String, dynamic>{
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
