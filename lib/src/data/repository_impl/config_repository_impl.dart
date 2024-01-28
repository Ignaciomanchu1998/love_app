import 'package:love_app/src/data/datasource/consumer/config_consumer.dart';
import 'package:love_app/src/domain/models/config_model.dart';
import 'package:love_app/src/domain/repositories/config_repository.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  final ConfigConsumer config;

  ConfigRepositoryImpl(this.config);

  @override
  Future<int> delete() {
    return config.delete();
  }

  @override
  Future<List<ConfigModel>> get() {
    return config.get();
  }

  @override
  Future<int> save(ConfigModel data) {
    return config.save(data);
  }
}
