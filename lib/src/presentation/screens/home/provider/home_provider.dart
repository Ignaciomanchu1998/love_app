import 'package:flutter/foundation.dart';
import 'package:love_app/src/domain/models/config_model.dart';
import 'package:love_app/src/domain/repositories/config_repository.dart';

class HomeProvider extends ChangeNotifier {
  final ConfigRepository config;

  HomeProvider({required this.config});

  String? name;

  Future<void> init() async {
    final resp = await config.get();

    if (resp.isNotEmpty) {
      name = resp.first.name;
    }
    notifyListeners();
  }

  Future<void> save({required Map<String, dynamic> data}) async {
    final model = ConfigModel(
      name: data['name'],
      message: data['message'],
      isWomen: data['isWomen'],
    );
    await config.delete();
    await config.save(model);
    await init();
  }
}
