import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../../shareds/shareds.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = '/home';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const ImageBackgroundShared(),
        ChangeNotifierProvider(
          create: (context) {
            final provider = HomeProvider(
              config: context.read(),
            );
            provider.init();
            return provider;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _Body(size: size),
            floatingActionButton: const _FloatingActionButton(),
          ),
        ),
      ],
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return FloatingActionButton(
      onPressed: () => context.pushNamed(
        '/config',
        extra: provider,
      ),
      backgroundColor: Colors.indigo,
      child: const Icon(
        Ionicons.cog_outline,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({required this.size});

  final Size size;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  double left = 50.0;
  double bottom = 10.0;
  final margin = 50.0;
  final ran = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: LayoutBuilder(
        builder: (context, value) {
          return SizedBox(
            height: value.maxHeight,
            width: value.maxWidth,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: FadeInDown(
                    duration: const Duration(seconds: 1),
                    child: TextCustomShared(
                      text: '${provider.name ?? 'Hola'}, quieres ser mi novia?',
                      fontSize: 40,
                      textAlign: TextAlign.center,
                      fontFamily: 'SemiBold',
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.6),
                  child: FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: ButtonShared(
                      onPressed: () {},
                      size: widget.size,
                      message: 'Sí 😊',
                      height: 100,
                    ),
                  ),
                ),
                Positioned(
                  left: left,
                  bottom: bottom,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.forbidden,
                    onHover: (_) {
                      left = ran.nextDouble() * (value.maxWidth - margin);
                      bottom = ran.nextDouble() * (value.maxHeight - margin);
                      setState(() {});
                    },
                    child: FadeInRightBig(
                      duration: const Duration(seconds: 1),
                      child: ButtonShared(
                        onPressed: () {},
                        height: 75,
                        message: 'No',
                        size: widget.size,
                        width: 200,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.grey.withOpacity(0.6),
                          Colors.grey,
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
