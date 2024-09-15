import 'package:flutter/material.dart';

class QMDBHeadlineMedium extends StatelessWidget {
  const QMDBHeadlineMedium(
      {required this.text, super.key, this.textColor, this.textAlign});
  final String? text;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}

class QMDBHeadlineLarge extends StatelessWidget {
  const QMDBHeadlineLarge(
      {required this.text, super.key, this.textColor, this.textAlign});

  final String? text;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style:
          Theme.of(context).textTheme.headlineLarge?.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}
