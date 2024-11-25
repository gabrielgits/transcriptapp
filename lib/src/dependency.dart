import 'package:fecs/fecs.dart';
import 'package:feds/feds.dart';
import 'package:get_it/get_it.dart';
import 'package:transcriptapp/src/core/infra/services/ia_service_openia.dart';
import 'package:transcriptapp/src/features/auth/infra/repositories/repository_local_auth_impl.dart';
import 'package:transcriptapp/src/features/auth/infra/repositories/repository_remote_auth_impl.dart';



import 'features/auth/domain/repositories/repository_local_auth.dart';
import 'features/auth/domain/repositories/repository_remote_auth.dart';

import 'core/domain/services/ia_service.dart';
import 'features/auth/domain/usecases/usecase_auth.dart';
import 'features/home/domain/repositories/repository_local_home.dart';
import 'features/home/domain/usecase/usecase_configs.dart';
import 'features/home/infra/repositories/repository_local_home_impl.dart';

final getIt = GetIt.instance;

void setupAppStart() {
  _setup();
  _setupHome();
  _setupAuth();
}

void _setup() {
  getIt.registerSingleton<FedsLocal>(FedsLocalSharedPref());
  getIt.registerSingleton<FecsData>(FecsDataFirebase());
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
