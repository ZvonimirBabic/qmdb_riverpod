import 'package:flutter/material.dart';

import '../../design/constants/colors.dart';
import '../text/body.dart';

class MovieRatingWidget extends StatelessWidget {
  const MovieRatingWidget({super.key, required this.voteAverage});

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: QMDBColors.yellow,
        ),
        const SizedBox(
          width: 4,
        ),
        QMDBBodySmall(text: '${voteAverage.toStringAsFixed(2)} / 10 IMDb')
      ],
    );
  }
}
