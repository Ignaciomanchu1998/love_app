import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../shareds/shareds.dart';

class BookRecomendationScreen extends StatelessWidget {
  const BookRecomendationScreen({super.key});

  static const name = '/book-recomendation';

  @override
  Widget build(BuildContext context) {
    final Object? params = GoRouterState.of(context).extra;

    return Scaffold(
      appBar: AppBar(
        title: const TextCustomShared(text: 'Libros recomendados'),
        centerTitle: true,
      ),
      body: SfPdfViewer.asset(
        params as String,
        interactionMode: PdfInteractionMode.pan,
      ),
    );
  }
}
