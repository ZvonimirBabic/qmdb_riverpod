// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularMoviesDTOAdapter extends TypeAdapter<PopularMoviesDTO> {
  @override
  final int typeId = 1;

  @override
  PopularMoviesDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularMoviesDTO(
      page: fields[1] as int,
      results: (fields[3] as List).cast<PopularMovieDTO>(),
      totalPages: fields[5] as int,
      totalResults: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PopularMoviesDTO obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(3)
      ..write(obj.results)
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
      other is PopularMoviesDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesDTO _$PopularMoviesDTOFromJson(Map<String, dynamic> json) =>
    PopularMoviesDTO(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => PopularMovieDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$PopularMoviesDTOToJson(PopularMoviesDTO instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
