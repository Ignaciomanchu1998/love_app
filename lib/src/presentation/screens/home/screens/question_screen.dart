import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  static const name = '/question';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('QuestionScreen'),
      ),
    );
  }
}
