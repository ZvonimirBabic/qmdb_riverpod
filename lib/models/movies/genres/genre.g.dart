// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final int typeId = 4;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[1] as int,
      name: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GenresResponse _$GenresResponseFromJson(Map<String, dynamic> json) =>
    GenresResponse(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresResponseToJson(GenresResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
