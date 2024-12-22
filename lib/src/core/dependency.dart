import 'package:get_it/get_it.dart';
import 'package:transcriptapp/src/features/auth/data/repositories/auth_repository.dart';
import 'package:transcriptapp/src/features/config/data/repositories/config_repository.dart';
import 'package:transcriptapp/src/features/attendances/data/repositories/auth_repository_remote.dart';
import 'package:transcriptapp/src/features/auth/data/repositories/auth_repository_remote.dart';
import 'package:transcriptapp/src/features/config/data/repositories/config_repository_local.dart';
import 'package:transcriptapp/src/features/dailypoints/data/repositories/dailypoints_repository.dart';
import 'package:transcriptapp/src/features/dailypoints/data/repositories/dailypoints_repository_remote.dart';
import 'package:transcriptapp/src/features/testes/data/repositories/testes_repository.dart';
import 'package:transcriptapp/src/features/testes/data/repositories/testes_repository_remote.dart';

import '../shared/data/services/dio_client_service.dart';
import '../shared/data/services/ia_service_openia.dart';
import '../shared/data/services/sharedpref_service.dart';


final getIt = GetIt.instance;

void setupAppStart() {
  _setup();
  _setupHome();
  _setupConfig();
  _setupAuth();
  _setupTestes();
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
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryRemote(dioClientService:getIt() ,sharedPrefService: getIt()),
  );
}

void _setupTestes() {
  getIt.registerSingleton<TestesRepository>(
    TestesRepositoryRemote(getIt()),
  );
}

void _setupAttendances() {
  getIt.registerSingleton<AttendancesRepositoryRemote>(
    AttendancesRepositoryRemote(getIt()),
  );

}

void _setupDailypoints() {
  getIt.registerSingleton<DailypointsRepository>(
    DailypointsRepositoryRemote(getIt()),
  );
}
