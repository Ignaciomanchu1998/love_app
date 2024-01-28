import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:love_app/src/domain/repositories/config_repository.dart';
import 'package:love_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'routes/app_route.dart';
import 'src/data/datasource/consumer/config_consumer.dart';
import 'src/data/datasource/local/database.dart';
import 'src/data/repository_impl/config_repository_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();

  runApp(
    MultiProvider(
      providers: [
        Provider<ConfigRepository>(
          create: (_) {
            return ConfigRepositoryImpl(
              ConfigConsumer(DatabaseLocal()),
            );
          },
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme().theme,
    );
  }
}
