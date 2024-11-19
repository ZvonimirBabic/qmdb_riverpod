import 'package:flutter/material.dart';
import 'package:qmdb/shared_widgets/text/headline.dart';

class MoviesFavouritesScreen extends StatelessWidget {
  const MoviesFavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            QMDBHeadlineLarge(text: 'Favourites'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Placeholder(
              child: Center(
                child: Text('Favourites'),
              ),
            )),
          ],
        ),
      );
}
