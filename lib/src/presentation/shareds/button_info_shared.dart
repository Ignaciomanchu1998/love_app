import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ButtonInfo extends StatelessWidget {
  const ButtonInfo({
    super.key,
    this.onPressed,
    this.alignment,
    this.colors,
    this.icon,
    this.size,
    this.iconColor,
  });

  final VoidCallback? onPressed;
  final AlignmentGeometry? alignment;
  final List<Color>? colors;
  final IconData? icon;
  final double? size;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.bottomLeft,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: colors ??
                  [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.3),
                  ],
            ),
          ),
          child: Icon(
            icon ?? Ionicons.ellipse_outline,
            size: size ?? 35,
            color: iconColor ?? Colors.white54,
          ),
        ),
      ),
    );
  }
}
