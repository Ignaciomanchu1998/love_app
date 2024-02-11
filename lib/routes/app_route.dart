import 'package:go_router/go_router.dart';
import 'package:love_app/src/presentation/screens/screens.dart';

final router = GoRouter(
  initialLocation: '/initial',
  routes: [
    GoRoute(
      path: '/initial',
      name: InitialScreen.name,
      builder: (context, state) => const InitialScreen(),
    ),
    GoRoute(
      path: '/question',
      name: QuestionScreen.name,
      builder: (context, state) => const QuestionScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/answer',
      name: AnswerScreen.name,
      builder: (context, state) => const AnswerScreen(),
    ),
    GoRoute(
      path: '/config',
      name: ConfigScreen.name,
      builder: (context, state) => const ConfigScreen(),
    ),
    GoRoute(
      path: '/book-recomendation',
      name: BookRecomendationScreen.name,
      builder: (context, state) => const BookRecomendationScreen(),
    ),
    GoRoute(
      path: '/book-webview',
      name: BookWebViewScreen.name,
      builder: (context, state) => const BookWebViewScreen(),
    ),
  ],
);
