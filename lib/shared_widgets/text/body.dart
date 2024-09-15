import 'package:flutter/material.dart';

class QMDBBodyMedium extends StatelessWidget {
  const QMDBBodyMedium(
      {required this.text, super.key, this.textColor, this.textAlign});
  final String text;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}

class QMDBBodySmall extends StatelessWidget {
  const QMDBBodySmall(
      {required this.text, super.key, this.textColor, this.textAlign});
  final String? text;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}

class QMDBBodyLarge extends StatelessWidget {
  const QMDBBodyLarge(
      {required this.text, super.key, this.textColor, this.textAlign});
  final String? text;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}
