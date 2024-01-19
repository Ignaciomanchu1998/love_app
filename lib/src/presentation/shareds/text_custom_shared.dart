import 'package:flutter/material.dart';

class TextCustomShared extends StatelessWidget {
  const TextCustomShared({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontFamily,
  });

  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 15,
        color: color ?? Colors.black,
        fontFamily: fontFamily ?? 'Medium',
      ),
      textAlign: textAlign,
    );
  }
}
