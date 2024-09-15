// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesResponseAdapter extends TypeAdapter<MoviesResponse> {
  @override
  final int typeId = 1;

  @override
  MoviesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesResponse(
      page: fields[1] as int,
      moviesBasicList: (fields[3] as List).cast<MovieBasic>(),
      totalPages: fields[5] as int,
      totalResults: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(3)
      ..write(obj.moviesBasicList)
      ..writeByte(5)
      ..write(obj.totalPages)
      ..writeByte(7)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    MoviesResponse(
      page: (json['page'] as num).toInt(),
      moviesBasicList: (json['results'] as List<dynamic>)
          .map((e) => MovieBasic.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.moviesBasicList,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
