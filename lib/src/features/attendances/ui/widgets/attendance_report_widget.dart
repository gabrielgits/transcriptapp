import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/shared/ui/screens/show_error_view.dart';

import '../view_models/attendances_view_model.dart';

class AttendanceReportWidget extends ConsumerWidget {
  const AttendanceReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;
    final controller = ref.watch(getReportAttendancesViewModelProvider);

    return controller.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ShowErrorView(
        title: 'Error on get attendances',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (report) {
        var color = Colors.red;
        final percent = report.percent;
        if (percent >= 50 && percent < 70) {
          color = Colors.yellow;
        }
        if (percent >= 70 && percent < 90) {
          color = Colors.blue;
        }
        if (percent >= 90) {
          color = Colors.green;
        }
        return InkWell(
          onTap: () {
            context.pushNamed('attendances');
          },
          child: Column(
            children: [
              Text(tr('home.attendances'),
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: space),
              Row(
                children: [
                  Text(
                    tr('attendances.countPresent'),
                  ),
                  const Spacer(),
                  Text(report.countPresent.toString()),
                ],
              ),
              const SizedBox(height: space),
              Row(
                children: [
                  Text(
                    tr('attendances.countAbsent'),
                  ),
                  const Spacer(),
                  Text(report.countAbsent.toString()),
                ],
              ),
              Text("${percent.toStringAsFixed(1)} %",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              // progress bar
              const SizedBox(height: space),
              LinearProgressIndicator(
                minHeight: 10,
                value: percent / 100,
                backgroundColor: Colors.grey,
                color: color,
              ),
            ],
          ),
        );
      },
    );
  }
}
