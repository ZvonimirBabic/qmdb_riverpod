import 'package:flutter/material.dart';

class QMDBLabelSmall extends StatelessWidget {
  const QMDBLabelSmall(
      {required this.text, super.key, this.textColor, this.textAlign});
  final String? text;
  final Color? textColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: textColor),
      textAlign: textAlign,
    );
  }
}
