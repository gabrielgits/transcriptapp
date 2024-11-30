import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/core/helpers/date_helper.dart';
import 'package:transcriptapp/src/core/presenter/screens/no_data_view.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/core/presenter/widgets/custom_appbar_widget.dart';
import 'package:transcriptapp/src/core/presenter/widgets/loading_widget.dart';

import '../controllers/dailypoints_controller.dart';

class DailypointsListScreen extends ConsumerWidget {
  const DailypointsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getAllDailypointsProvider);
    return Scaffold(
      appBar: CustomAppbarWidget(
        title: tr('dailypoints.title'),
      ),
      body: controller.when(
        loading: () => const Center(child: LoadingWidget()),
        error: (error, _) => ShowErrorView(
          title: 'Error on get dailypoints',
          detail: error.toString(),
          onPressed: () => {},
        ),
        data: (dailypoints) {
          if (dailypoints.isEmpty) {
            return NoDataView(title: tr('dailypoints.title'));
          }
          return ListView.builder(
            itemCount: dailypoints.length,
            itemBuilder: (context, index) {
              final dailypoint = dailypoints[index];
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/icons/app_icon.png'),
                  ),
                  title: Text(
                      "${tr('dailypoints.classeNumber')} : ${dailypoint.classeId}"),
                  subtitle: Text(
                      '${tr('dailypoints.date')}: ${dateHelper(date: dailypoint.createdAt.toString())}',
                      style: const TextStyle(fontSize: 10)),
                  trailing: Text(dailypoint.point.toString(), style: Theme.of(context).textTheme.titleLarge),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
