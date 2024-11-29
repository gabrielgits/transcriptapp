import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';

import '../controllers/attendances_controller.dart';

class AttendanceReportWidget extends ConsumerWidget {
  const AttendanceReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;
    final controller = ref.watch(getReportAttendancesProvider);

    return controller.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ShowErrorView(
        title: 'Error on get attendances',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (attendances) {
        var color = Colors.red;
        if (attendances['percent'] >= 50 && attendances['percent'] < 70) {
          color = Colors.yellow;
        }
        if (attendances['percent'] >= 70 && attendances['percent'] < 90) {
          color = Colors.blue;
        }
        if (attendances['percent'] >= 90) {
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
                  Text(attendances['countPresent'].toString()),
                ],
              ),
              const SizedBox(height: space),
              Row(
                children: [
                  Text(
                    tr('attendances.countAbsent'),
                  ),
                  const Spacer(),
                  Text(attendances['countAbsent'].toString()),
                ],
              ),
              Text("${attendances['percent']} %",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              // progress bar
              const SizedBox(height: space),
              LinearProgressIndicator(
                minHeight: 10,
                value: attendances['percent'] / 100,
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
