import 'package:feds/feds.dart';
import 'package:transcriptapp/src/config/constants.dart';

import '../../domain/repositories/repository_remote_dailypoints.dart';

class RepositoryRemoteDailypointsImpl implements RepositoryRemoteDailypoints {
  final FedsRest datasource;
  const RepositoryRemoteDailypointsImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> getListDailypoints(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/dailypoints/student/$id/all',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getDailypointReport(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/dailypoints/student/$id',
      token: AppConstants.token,
    );
  }
}
