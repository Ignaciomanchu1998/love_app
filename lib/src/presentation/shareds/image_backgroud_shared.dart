import 'package:flutter/material.dart';

class ImageBackgroundShared extends StatelessWidget {
  const ImageBackgroundShared({super.key, this.start, this.end});

  final Color? start;
  final Color? end;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [
            start ?? Colors.black.withOpacity(0.6),
            end ?? Colors.black12,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image-02.jpg'),
            scale: 1.0,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black45,
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}
