import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/home/domain/models/config_model.dart';
import 'package:transcriptapp/src/features/home/domain/repositories/repository_local_home.dart';
import 'package:transcriptapp/src/features/home/domain/usecase/usecase_configs.dart';

import 'usecase_configs_test.mocks.dart';

// Generate mocks using build_runner
@GenerateMocks([RepositoryLocalHome])
void main() {
  late MockRepositoryLocalHome mockRepositoryLocal;
  late UsecaseConfigs usecaseConfigs;

  setUp(() {
    mockRepositoryLocal = MockRepositoryLocalHome();
    usecaseConfigs = UsecaseConfigs(mockRepositoryLocal);
  });

  test(
      'updateConfig should return updated config and ExptDataNoExpt on success',
      () async {
    const config = ConfigModel(
      id: 1,
      name: 'Test Config',
      studentId: 1,
      token: '',
      language: 'en',
    );
    when(mockRepositoryLocal.updateConfig(config)).thenAnswer((_) async => 1);

    final result = await usecaseConfigs.updateConfig(config);

    expect(result.item, config);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

  test('updateConfig should return exception on unsuccessful update', () async {
    const config = ConfigModel(
      id: 1,
      name: 'Test Config',
      studentId: 1,
      token: '',
      language: 'en',
    );
    when(mockRepositoryLocal.updateConfig(config)).thenAnswer((_) async => 0);

    final result = await usecaseConfigs.updateConfig(config);

    expect(result.item, ConfigModel.init());
    expect(result.exception, isA<ExptDataSave>());
  });

  test('updateConfig should return exception when updateConfig throwsException',
      () async {
    const config = ConfigModel(
      id: 1,
      name: 'Test Config',
      studentId: 1,
      token: '',
      language: 'en',
    );
    when(mockRepositoryLocal.updateConfig(config))
        .thenThrow((_) async => throwsException);

    final result = await usecaseConfigs.updateConfig(config);

    expect(result.item, ConfigModel.init());
    expect(result.exception, isA<ExptDataUnknown>());
  });

  test('loadConfig should return config and ExptDataNoExpt on success',
      () async {
    const config = ConfigModel(
      id: 1,
      name: 'Test Config',
      studentId: 1,
      token: '',
      language: 'en',
    );
    when(mockRepositoryLocal.getConfig(1)).thenAnswer((_) async => config);

    final result = await usecaseConfigs.loadConfig();

    expect(result.item, config);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

  test('loadConfig should return exception when getConfig fail', () async {
    when(mockRepositoryLocal.getConfig(1))
        .thenAnswer((_) async => ConfigModel.init());

    final result = await usecaseConfigs.loadConfig();

    expect(result.item, ConfigModel.init());
    expect(result.exception, isA<ExptDataLoad>());
  });

  test('loadConfig should return exception when getConfig throwsException',
      () async {
    when(mockRepositoryLocal.getConfig(1))
        .thenThrow((_) async => throwsException);

    final result = await usecaseConfigs.loadConfig();

    expect(result.item, ConfigModel.init());
    expect(result.exception, isA<ExptDataUnknown>());
  });

  test('saveConfig should return id and ExptDataNoExpt on success', () async {
    const config = ConfigModel(
      id: 1,
      name: 'Test Config',
      studentId: 1,
      token: '',
      language: 'en',
    );
    when(mockRepositoryLocal.saveConfig(config)).thenAnswer((_) async => 1);

    final result = await usecaseConfigs.saveConfig(config);

    expect(result.id, 1);
    expect(result.exception, isA<ExptDataNoExpt>());
  });

  test('saveConfig should return exception when saveConfig fail', () async {
    const config = ConfigModel(
      id: 1,
      name: 'Test Config',
      studentId: 1,
      token: '',
      language: 'en',
    );
    when(mockRepositoryLocal.saveConfig(config)).thenAnswer((_) async => 0);

    final result = await usecaseConfigs.saveConfig(config);

    expect(result.id, 0);
    expect(result.exception, isA<ExptDataSave>());
  });

  test('saveConfig should return exception when saveConfig throwsException',
      () async {
    const config = ConfigModel(
      id: 1,
      name: 'Test Config',
      studentId: 1,
      token: '',
      language: 'en',
    );
    when(mockRepositoryLocal.saveConfig(config))
        .thenThrow((_) async => throwsException);

    final result = await usecaseConfigs.saveConfig(config);

    expect(result.id, 0);
    expect(result.exception, isA<ExptDataUnknown>());
  });
}
