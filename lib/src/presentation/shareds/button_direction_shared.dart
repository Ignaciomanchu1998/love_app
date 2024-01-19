import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonDirectionShared extends StatelessWidget {
  const ButtonDirectionShared({
    super.key,
    required this.onPressed,
    required this.size,
    required this.pathIcon,
    this.height,
    this.colors,
    this.colorIcon,
  });

  final VoidCallback onPressed;
  final Size size;
  final String pathIcon;
  final double? height;
  final List<Color>? colors;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(70),
      onTap: onPressed,
      child: Container(
        height: height ?? 130,
        width: size.width * 0.7,
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
          child: SvgPicture.asset(
            pathIcon,
            colorFilter: ColorFilter.mode(
              colorIcon ?? Colors.white,
              BlendMode.srcIn,
            ),
            width: 75,
            height: 75,
          ),
        ),
      ),
    );
  }
}
