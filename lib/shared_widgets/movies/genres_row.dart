import 'package:flutter/material.dart';

import '../../design/constants/colors.dart';
import '../../models/movies/genres/genre.dart';
import '../text/body.dart';

class GenresRow extends StatelessWidget {
  const GenresRow({super.key, this.genres = const <Genre>[]});
  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: genres.map((genre) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: QMDBColors.themePrimaryFadedDark),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Center(
                  child: QMDBBodySmall(text: genre.name),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
