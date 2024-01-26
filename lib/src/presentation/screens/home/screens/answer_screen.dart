import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../shareds/shareds.dart';
import '../provider/home_provider.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

  static const name = '/answer';

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  late VideoPlayerController controller;
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  void loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/videos/production.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
    controller.play();
    controller.setLooping(true);
    controller.setVolume(0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) {
        final provider = HomeProvider(
          config: context.read(),
        );
        provider.init();
        return provider;
      },
      child: Stack(
        children: [
          _VideoBackground(controller: controller),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: _Body(size: size),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.go('/initial'),
              backgroundColor: Colors.indigo,
              child: const Icon(
                Ionicons.arrow_back_outline,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Todo: Video de fondo.
class _VideoBackground extends StatelessWidget {
  const _VideoBackground({
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: controller.value.size.width,
          height: controller.value.size.height,
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.black, Colors.black12],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ).createShader(bounds),
            blendMode: BlendMode.darken,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: Stack(
        children: [
          ButtonInfo(
            onPressed: () => recomendationModal(
              context: context,
            ),
            alignment: Alignment.topCenter,
          ),
          ButtonInfo(
            onPressed: () => messageModal(
              context: context,
              name: provider.name ?? '',
              message: provider.message ?? '',
            ),
            icon: Ionicons.chatbubble_outline,
            size: 25,
            iconColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Future<void> recomendationModal({
    required BuildContext context,
  }) async {
    return showAdaptiveDialog(
      context: context,
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
      builder: (context) => AlertDialog.adaptive(
        insetAnimationDuration: const Duration(milliseconds: 100),
        insetAnimationCurve: Curves.easeInCubic,
        alignment: Alignment.topCenter,
        title: const TextCustomShared(
          text: 'Recomendaciones',
          textAlign: TextAlign.center,
          fontSize: 20,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextCustomShared(
              text:
                  'Son recomendaciones personales, creo que te puede ser de ayuda a la hora de tomar decisiones.',
              textAlign: TextAlign.center,
              fontFamily: 'Regular',
              fontSize: 15,
            ),
            const SizedBox(height: 20),
            ButtonRecomendationShared(
              onPressed: () => context.pushNamed(
                '/book-recomendation',
                extra:
                    'https://www.3abnnicaragua.tv/Imagenes/Recursos/Libros/Libro20.pdf',
              ),
              message: 'Enamórate bien',
            ),
            const SizedBox(height: 10),
            ButtonRecomendationShared(
              onPressed: () => context.pushNamed(
                '/book-recomendation',
                extra:
                    'https://itepeyac.interamerica.org/uploaded_assets/132286-20PerguntasQueDebesFormularATuNovia.pdf',
              ),
              message:
                  'Preguntas que debes 20 formular a tu novi@ antes de casarte',
            ),
            const SizedBox(height: 20),
            const TextCustomShared(
              text: 'Les deseo mis éxitos',
              textAlign: TextAlign.center,
              fontFamily: 'Regular',
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> messageModal({
    required BuildContext context,
    required String name,
    required String message,
  }) async {
    return showAdaptiveDialog(
      context: context,
      traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
      builder: (context) => AlertDialog.adaptive(
        insetAnimationDuration: const Duration(milliseconds: 100),
        insetAnimationCurve: Curves.easeInCubic,
        alignment: Alignment.bottomCenter,
        title: TextCustomShared(
          text: 'Para ti $name',
          textAlign: TextAlign.center,
          fontSize: 25,
        ),
        content: TextCustomShared(
          text: message,
          textAlign: TextAlign.center,
          fontFamily: 'Regular',
          fontSize: 20,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustomShared(
                  text: 'Entendido',
                  color: Colors.indigo,
                ),
                SizedBox(width: 10),
                Icon(Ionicons.close_outline)
              ],
            ),
          )
        ],
      ),
    );
  }
}
