import 'package:expt/expt.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';

import '../../domain/models/config_model.dart';
import '../../domain/usecase/usecase_configs.dart';

part 'controller_configs.g.dart';

@riverpod
class ControllerConfigs extends _$ControllerConfigs {
  final _usecaseConfigs = getIt<UsecaseConfigs>();

  @override
  FutureOr<ConfigModel> build() async {
    final result = await _usecaseConfigs.loadConfig();
    if (result.exception != ExptDataNoExpt()) {
      return ConfigModel.init();
    }
    return result.item;
  }

  Future<ConfigModel> loadConfig() async {
    state = const AsyncLoading();
    final result = await _usecaseConfigs.loadConfig();
    if (result.exception != ExptDataNoExpt()) {
      state = AsyncError(result.exception, StackTrace.current);
      return ConfigModel.init();
    }
    state = AsyncValue.data(result.item);
    return result.item;
  }

  Future<void> updateConfig(ConfigModel updateItem) async {
    state = const AsyncLoading();
    final result = await _usecaseConfigs.updateConfig(updateItem);
    if (result.exception != ExptDataNoExpt()) {
      state = AsyncError(result.exception, StackTrace.current);
    }
    state = AsyncValue.data(result.item);
  }

  Future<void> createConfig() async {
    state = const AsyncLoading();
    const config = ConfigModel(id: 1, studentId: 0, name: 'configs', token: '', language: 'en');
    final result = await _usecaseConfigs.saveConfig(config);
    if (result.exception != ExptDataNoExpt()) {
      state = AsyncError(result.exception, StackTrace.current);
    }
    state = const AsyncValue.data(config);
  }
}
