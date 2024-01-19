import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shareds/shareds.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  static const name = '/initial';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const ImageBackgroundShared(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                FadeInDown(
                  duration: const Duration(seconds: 1),
                  child: const Center(
                    child: TextCustomShared(
                      text: 'Conquista🤔',
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.15,
                  right: 0,
                  left: 0,
                  child: FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: ButtonDirectionShared(
                      onPressed: () => context.pushNamed('/question'),
                      size: size,
                      pathIcon: 'assets/svg/arrow_01.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
