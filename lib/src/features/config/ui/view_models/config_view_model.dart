import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../data/repositories/config_repository.dart';
import '../../domain/models/config_model.dart';

part 'config_view_model.g.dart';

@riverpod
class ConfigViewModel extends _$ConfigViewModel {
  @override
  Future<ConfigModel> build() async {
    return await _loadConfig();
  }

  Future<ConfigModel> _loadConfig() async {
    state = const AsyncLoading();

    final repositoryConfig = getIt<ConfigRepository>();
    final resultConfig = await repositoryConfig.getConfig();

    switch (resultConfig) {
      case Error<ConfigModel>():
        state = AsyncError(resultConfig.error, StackTrace.current);
        return ConfigModel.init();

      case Ok<ConfigModel>():
    }
    state = AsyncData(resultConfig.value);
    return resultConfig.value;
  }

  Future<void> createConfig() async {
    state = const AsyncLoading();
    final repositoryConfig = getIt<ConfigRepository>();

    final resultConfig = await repositoryConfig.saveConfig();
    switch (resultConfig) {
      case Error<ConfigModel>():
        state = AsyncError(resultConfig.error, StackTrace.current);
        return;

      case Ok<ConfigModel>():
    }
    state =  AsyncData(resultConfig.value);
  }

  Future<void> updateLocale(String language) async {
    state = const AsyncLoading();

    final repositoryConfig = getIt<ConfigRepository>();
    final result = await repositoryConfig.getConfig();

    switch (result) {
      case Error<ConfigModel>():
        state = AsyncError(result.error, StackTrace.current);
        return;

      case Ok<ConfigModel>():
    }
    state = AsyncData(result.value);
  }
}
