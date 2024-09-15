import 'package:flutter/material.dart';

class QMDBTitleMedium extends StatelessWidget {
  const QMDBTitleMedium(
      {required this.text, super.key, this.textColor, this.textAlign});
  final String? text;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style:
          Theme.of(context).textTheme.titleMedium?.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}
