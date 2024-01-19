import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../shareds/shareds.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  static const name = '/question';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const ImageBackgroundShared(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInRightBig(
                  duration: const Duration(seconds: 1),
                  child: const _Mind(),
                ),
                const SizedBox(height: 10),
                FadeInDown(
                  duration: const Duration(seconds: 1),
                  child: const TextCustomShared(
                    text: '¿Estás listo?',
                    fontSize: 60,
                    fontFamily: 'SemiBold',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                FadeInDown(
                  duration: const Duration(seconds: 1),
                  child: const TextCustomShared(
                    text:
                        'Es hora de que te prepares para la batalla, no será fácil, pero si lo logras, tendrás una gran recompensa.',
                    fontSize: 27,
                    fontFamily: 'SemiBold',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: ButtonDirectionShared(
                    onPressed: () {},
                    size: size,
                    pathIcon: 'assets/svg/arrow_01.svg',
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Mind extends StatelessWidget {
  const _Mind();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(),
        InkWell(
          onTap: () => openModal(context),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.2),
                ],
              ),
            ),
            child: const Icon(
              Ionicons.ellipse_outline,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> openModal(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        elevation: 0.1,
        alignment: Alignment.bottomCenter,
        title: const TextCustomShared(
          text: '¡Pro Tip para Programadores 🤑! ',
          fontSize: 28,
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextCustomShared(
              text:
                  'Si ella es programadora, dile lo siguiente: ¿Quieres ser el ; de mi código?',
              fontSize: 23,
            ),
            const SizedBox(height: 10),
            const TextCustomShared(
              text: 'Seguro que cae en tus brazos 🤣',
              fontSize: 15,
              fontFamily: 'Regular',
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(50),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustomShared(
                    text: 'Terminar',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10),
                  Icon(Ionicons.arrow_forward_outline)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
