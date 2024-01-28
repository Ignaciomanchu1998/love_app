import 'package:love_app/src/domain/models/config_model.dart';

import '../local/database.dart';

class ConfigConsumer {
  final DatabaseLocal database;

  ConfigConsumer(this.database);

  Future<int> save(ConfigModel data) async {
    return await database.insert(data);
  }

  Future<List<ConfigModel>> get() async {
    return await database.get();
  }

  Future<int> delete() async {
    return await database.delete();
  }
}
