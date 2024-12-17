import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/shared/ui/screens/no_data_view.dart';
import 'package:transcriptapp/src/shared/ui/screens/show_error_view.dart';

import '../view_models/view_model_student_score.dart';

class StudentScoreWidget extends ConsumerWidget {
  const StudentScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;

    final controller = ref.watch(getStudentScoreProvider);
    return controller.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ShowErrorView(
              title: 'Error on get Student Score',
              detail: error.toString(),
              onPressed: () => {},
            ),
        data: (studentReport) {
          if (studentReport.isEmpty) {
            return NoDataView(title: tr('home.totalPoints'));
          }
          return Column(
            children: [
              Text(tr('home.totalPoints'),
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: space),
                            Row(
                children: [
                  Text(
                    tr('student.testesAverage'),
                  ),
                  const Spacer(),
                  Text("${studentReport['testesAverage'].toStringAsFixed(1)} ${tr('testes.score')}"),
                ],
              ),
              const SizedBox(height: space),
                            Row(
                children: [
                  Text(
                    tr('student.attendancesPercent'),
                  ),
                  const Spacer(),
                  Text("${studentReport['attendancesPercent'].toStringAsFixed(1)} %"),
                ],
              ),
              const SizedBox(height: space),
                            Row(
                children: [
                  Text(
                    tr('student.dailypointsAverageFinal'),
                  ),
                  const Spacer(),
                  Text("${studentReport['dailypointsAverageFinal'].toStringAsFixed(1)} ${tr('testes.score')}"),
                ],
              ),
              const SizedBox(height: space),
              Text(
                "${tr('student.finalAverage')} : ${studentReport['finalAverage'].toStringAsFixed(1)} ${tr('testes.score')}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          );
        });
  }
}
