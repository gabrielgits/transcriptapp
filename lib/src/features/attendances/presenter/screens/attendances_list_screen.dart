import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/core/presenter/screens/no_data_view.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/core/presenter/widgets/custom_appbar_widget.dart';
import 'package:transcriptapp/src/core/presenter/widgets/loading_widget.dart';

import '../controllers/attendances_controller.dart';

class AttendancesListScreen extends ConsumerWidget {
  const AttendancesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getAllAttendancesProvider);
    return  Scaffold(
          appBar: CustomAppbarWidget(
            title: tr('attendances.title'),
          ),
          body: controller.when(
        loading: () => Center(child: const LoadingWidget()),
        error: (error, _) => ShowErrorView(
          title: 'Error on get attendances',
          detail: error.toString(),
          onPressed: () => {},
        ),
        data: (attendances) {
          if (attendances.isEmpty) {
            return NoDataView(title: tr('attendances.title'));
          }
          return ListView.builder(
            itemCount: attendances.length,
            itemBuilder: (context, index) {
              final attendance = attendances[index];
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/icons/default_game.png'),
                  ),
                  title: Text(
                      "$tr('attendances.classeNumber') : ${attendance.classeId}"),
                  subtitle: Text(
                      '${tr('attendances.date')}: ${attendance.createdAt} - ${tr(attendance.status)}',
                      style: const TextStyle(fontSize: 10)),
                ),
              );
            },
          );
        },
        ),
      
    );
  }
}