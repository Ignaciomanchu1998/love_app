import 'package:flutter/material.dart';
import 'package:love_app/src/presentation/shareds/shareds.dart';

class ButtonShared extends StatelessWidget {
  const ButtonShared({
    super.key,
    required this.onPressed,
    required this.size,
    required this.message,
    this.height,
    this.width,
    this.colors,
    this.colorIcon,
  });

  final VoidCallback onPressed;
  final Size size;
  final String message;
  final double? height;
  final double? width;
  final List<Color>? colors;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(70),
        topRight: Radius.circular(70),
      ),
      onTap: onPressed,
      child: Container(
        height: height ?? 130,
        width: width ?? size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(70),
            topRight: Radius.circular(70),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: colors ??
                [
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.3),
                  Colors.white,
                ],
          ),
        ),
        child: Center(
          child: TextCustomShared(
            text: message,
            fontSize: 40,
            textAlign: TextAlign.center,
            color: colorIcon ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
