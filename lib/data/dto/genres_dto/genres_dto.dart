import '../genre_dto/genre_dto.dart';

class GenresDTO {
  List<GenreDTO>? genres;

  GenresDTO({this.genres});

  GenresDTO.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <GenreDTO>[];
      json['genres'].forEach((v) {
        genres!.add(new GenreDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
