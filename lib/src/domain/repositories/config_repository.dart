import '../models/config_model.dart';

abstract class ConfigRepository {
  Future<int> save(ConfigModel data);
  Future<List<ConfigModel>> get();
  Future<int> delete();
}
