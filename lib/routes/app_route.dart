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
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/config',
      name: ConfigScreen.name,
      builder: (context, state) => const ConfigScreen(),
    ),
  ],
);
