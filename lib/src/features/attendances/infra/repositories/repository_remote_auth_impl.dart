import 'package:feds/feds.dart';
import 'package:transcriptapp/src/core/constants.dart';

import '../../domain/repositories/repository_remote_exams.dart';

class RepositoryRemoteAttendancesImpl implements RepositoryRemoteAttendances {
  final FedsRest datasource;
  const RepositoryRemoteAttendancesImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> getListAttendances(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/attendances/student/$id/all',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getAttendanceReport(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/attendances/student/$id',
      token: AppConstants.token,
    );
  }
}
