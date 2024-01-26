import 'package:flutter/material.dart';

import 'shareds.dart';

class ButtonRecomendationShared extends StatelessWidget {
  const ButtonRecomendationShared({
    super.key,
    this.onPressed,
    required this.message,
  });

  final VoidCallback? onPressed;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Colors.black26),
        ),
        child: TextCustomShared(
          text: message,
          fontSize: 14,
        ),
      ),
    );
  }
}
