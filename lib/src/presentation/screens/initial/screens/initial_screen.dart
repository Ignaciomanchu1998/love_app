import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  static const name = '/initial';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('InitialScreen'),
      ),
    );
  }
}
