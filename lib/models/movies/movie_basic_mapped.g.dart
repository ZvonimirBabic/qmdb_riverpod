// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_basic_mapped.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieBasicMappedAdapter extends TypeAdapter<MovieBasicMapped> {
  @override
  final int typeId = 2;

  @override
  MovieBasicMapped read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieBasicMapped(
      genres: (fields[0] as List).cast<Genre>(),
      id: fields[1] as int,
      posterPath: fields[2] as String,
      title: fields[3] as String,
      voteAverage: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MovieBasicMapped obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.genres)
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
      other is MovieBasicMappedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieBasicMapped _$MovieBasicMappedFromJson(Map<String, dynamic> json) =>
    MovieBasicMapped(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num).toInt(),
      posterPath: json['poster_path'] as String,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieBasicMappedToJson(MovieBasicMapped instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
    };
