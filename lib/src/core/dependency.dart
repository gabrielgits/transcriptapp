import 'package:get_it/get_it.dart';
import 'package:transcriptapp/src/features/config/data/repositories/config_repository.dart';
import 'package:transcriptapp/src/shared/data/services/ia_service_openia.dart';
import 'package:transcriptapp/src/features/attendances/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/attendances/domain/usecases/usecase_attendances.dart';
import 'package:transcriptapp/src/features/attendances/infra/repositories/repository_remote_auth_impl.dart';
import 'package:transcriptapp/src/features/auth/infra/repositories/repository_local_auth_impl.dart';
import 'package:transcriptapp/src/features/auth/data/repositories/auth_repository_remote.dart';
import 'package:transcriptapp/src/features/dailypoints/domain/repositories/repository_remote_dailypoints.dart';
import 'package:transcriptapp/src/features/dailypoints/domain/usecases/usecase_attendances.dart';
import 'package:transcriptapp/src/features/dailypoints/infra/repositories/repository_remote_auth_impl.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_play_teste.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_testes.dart';
import 'package:transcriptapp/src/features/exams/infra/repositories/repository_remote_auth_impl.dart';

import '../features/auth/data/repositories/repository_local_auth.dart';
import '../features/auth/data/repositories/auth_repository.dart';

import '../features/auth/domain/usecases/usecase_auth.dart';
import '../features/config/data/repositories/config_repository_local.dart';
import '../shared/data/services/sharedpref_service.dart';
import '../shared/data/services/dio_client_service.dart';

final getIt = GetIt.instance;

void setupAppStart() {
  _setup();
  _setupHome();
  _setupConfig();
  _setupAuth();
  _setupExams();
  _setupAttendances();
  _setupDailypoints();
}

void _setup() {
  getIt.registerSingleton(SharedPrefService());
  getIt.registerSingleton(DioClientService());
  getIt.registerSingleton(IaServiceOpenia(''));
}

void _setupHome() {}

void _setupConfig() {
  getIt.registerSingleton<ConfigRepository>(
    ConfigRepositoryLocal(getIt()),
  );
}

void _setupAuth() {
  getIt.registerSingleton<RepositoryLocalAuth>(
    RepositoryLocalAuthImpl(getIt()),
  );
  getIt.registerSingleton<AuthRepository>(
    RepositoryRemoteAuthImpl(getIt<FedsRest>()),
  );

  getIt.registerSingleton(
    UsecaseAuth(
      repositoryLocal: getIt<RepositoryLocalAuth>(),
      repositoryRemote: getIt<AuthRepository>(),
    ),
  );
}

void _setupExams() {
  getIt.registerSingleton<RepositoryRemoteExams>(
    RepositoryRemoteExamsImpl(getIt<FedsRest>()),
  );

  getIt.registerSingleton(
    UsecaseExams(getIt<RepositoryRemoteExams>()),
  );

  getIt.registerSingleton(
    UsecasePlayTeste(repositoryRemote: getIt<RepositoryRemoteExams>()),
  );

  getIt.registerSingleton(
    UsecaseTestes(getIt<RepositoryRemoteExams>()),
  );
}

void _setupAttendances() {
  getIt.registerSingleton<RepositoryRemoteAttendances>(
    RepositoryRemoteAttendancesImpl(getIt<FedsRest>()),
  );

  getIt.registerSingleton(
    UsecaseAttendances(getIt<RepositoryRemoteAttendances>()),
  );
}

void _setupDailypoints() {
  getIt.registerSingleton<RepositoryRemoteDailypoints>(
    RepositoryRemoteDailypointsImpl(getIt<FedsRest>()),
  );

  getIt.registerSingleton(
    UsecaseDailypoints(getIt<RepositoryRemoteDailypoints>()),
  );
}
