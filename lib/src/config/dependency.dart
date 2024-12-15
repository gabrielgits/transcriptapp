import 'package:feds/feds.dart';
import 'package:get_it/get_it.dart';
import 'package:transcriptapp/src/shared/data/services/ia_service_openia.dart';
import 'package:transcriptapp/src/features/attendances/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/attendances/domain/usecases/usecase_attendances.dart';
import 'package:transcriptapp/src/features/attendances/infra/repositories/repository_remote_auth_impl.dart';
import 'package:transcriptapp/src/features/auth/infra/repositories/repository_local_auth_impl.dart';
import 'package:transcriptapp/src/features/auth/infra/repositories/repository_remote_auth_impl.dart';
import 'package:transcriptapp/src/features/dailypoints/domain/repositories/repository_remote_dailypoints.dart';
import 'package:transcriptapp/src/features/dailypoints/domain/usecases/usecase_attendances.dart';
import 'package:transcriptapp/src/features/dailypoints/infra/repositories/repository_remote_auth_impl.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_play_teste.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_testes.dart';
import 'package:transcriptapp/src/features/exams/infra/repositories/repository_remote_auth_impl.dart';

import '../features/auth/domain/repositories/repository_local_auth.dart';
import '../features/auth/domain/repositories/repository_remote_auth.dart';

import '../shared/data/services/ia_service.dart';
import '../features/auth/domain/usecases/usecase_auth.dart';
import '../features/home/domain/repositories/repository_local_home.dart';
import '../features/home/domain/usecase/usecase_configs.dart';
import '../features/home/infra/repositories/repository_local_home_impl.dart';

final getIt = GetIt.instance;

void setupAppStart() {
  _setup();
  _setupHome();
  _setupAuth();
  _setupExams();
  _setupAttendances();
  _setupDailypoints();
}

void _setup() {
  getIt.registerSingleton<FedsLocal>(FedsLocalSharedPref());
  getIt.registerSingleton<FedsRest>(FedsRestDio());
  getIt.registerSingleton<IaService>(IaServiceOpenia(''));
}

void _setupHome() {
  getIt.registerSingleton<RepositoryLocalHome>(
    RepositoryLocalHomeImpl(getIt<FedsLocal>()),
  );

  getIt.registerSingleton(
    UsecaseConfigs(getIt<RepositoryLocalHome>()),
  );
}

void _setupAuth() {
  getIt.registerSingleton<RepositoryLocalAuth>(
    RepositoryLocalAuthImpl(getIt<FedsLocal>()),
  );
  getIt.registerSingleton<RepositoryRemoteAuth>(
    RepositoryRemoteAuthImpl(getIt<FedsRest>()),
  );

  getIt.registerSingleton(
    UsecaseAuth(
      repositoryLocal: getIt<RepositoryLocalAuth>(),
      repositoryRemote: getIt<RepositoryRemoteAuth>(),
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
