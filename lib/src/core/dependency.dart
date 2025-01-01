import 'package:get_it/get_it.dart';
import 'package:transcriptapp/src/features/attendances/data/repositories/attendances_repository.dart';
import 'package:transcriptapp/src/features/attendances/data/services/attendances_api_services.dart';
import 'package:transcriptapp/src/features/auth/data/repositories/auth_repository.dart';
import 'package:transcriptapp/src/features/auth/data/services/auth_api_services.dart';
import 'package:transcriptapp/src/features/auth/data/services/auth_cache_services.dart';
import 'package:transcriptapp/src/features/config/data/repositories/config_repository.dart';
import 'package:transcriptapp/src/features/attendances/data/repositories/attendances_repository_remote.dart';
import 'package:transcriptapp/src/features/auth/data/repositories/auth_repository_remote.dart';
import 'package:transcriptapp/src/features/config/data/repositories/config_repository_local.dart';
import 'package:transcriptapp/src/features/config/data/services/config_cache_services.dart';
import 'package:transcriptapp/src/features/dailypoints/data/repositories/dailypoints_repository.dart';
import 'package:transcriptapp/src/features/dailypoints/data/repositories/dailypoints_repository_remote.dart';
import 'package:transcriptapp/src/features/dailypoints/data/services/dailypoints_api_services.dart';
import 'package:transcriptapp/src/features/testes/data/repositories/testes_repository.dart';
import 'package:transcriptapp/src/features/testes/data/repositories/testes_repository_remote.dart';
import 'package:transcriptapp/src/features/testes/data/services/testes_api_service.dart';

import '../shared/datasources/dio_datasource.dart';
import '../shared/datasources/openia_datasource.dart';
import '../shared/datasources/sharedpref_datasource.dart';


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
  getIt.registerSingleton(SharedPrefDatasource());
  getIt.registerSingleton(DioDatasource());
  getIt.registerSingleton(OpeniaDatasource(''));
}

void _setupHome() {}

void _setupConfig() {
  getIt.registerSingleton(ConfigCacheServices(getIt()));
  getIt.registerSingleton<ConfigRepository>(
    ConfigRepositoryLocal(dioClientService: getIt(), configCacheServices: getIt()),
  );
}

void _setupAuth() {
  getIt.registerSingleton(AuthCacheServices(getIt()));
  getIt.registerSingleton(AuthApiServices(getIt()));
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryRemote(authApiServices:getIt() ,authCacheServices: getIt()),
  );
}

void _setupTestes() {
   getIt.registerSingleton(TestesApiService(getIt()));
  getIt.registerSingleton<TestesRepository>(
    TestesRepositoryRemote(getIt()),
  );
}

void _setupAttendances() {
   getIt.registerSingleton(AttendancesApiServices(getIt()));
  getIt.registerSingleton<AttendancesRepository>(
    AttendancesRepositoryRemote(getIt()),
  );

}

void _setupDailypoints() {
   getIt.registerSingleton(DailypointsApiServices(getIt()));
  getIt.registerSingleton<DailypointsRepository>(
    DailypointsRepositoryRemote(getIt()),
  );

}
