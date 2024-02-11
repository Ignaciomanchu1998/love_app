import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookWebViewScreen extends StatelessWidget {
  const BookWebViewScreen({super.key});

  static const name = '/book-webview';

  @override
  Widget build(BuildContext context) {
    final Object? params = GoRouterState.of(context).extra;

    return Scaffold(
      appBar: AppBar(),
      body: _Body(url: params as String),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({required this.url});

  final String url;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (controller) {
            isLoading = false;
            setState(() {});
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (isLoading) const LinearProgressIndicator(),
      ],
    );
  }
}
