import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/utils/date_helper.dart';
import 'package:transcriptapp/src/shared/ui/screens/no_data_view.dart';
import 'package:transcriptapp/src/shared/ui/screens/show_error_view.dart';
import 'package:transcriptapp/src/shared/ui/widgets/custom_appbar_widget.dart';
import 'package:transcriptapp/src/shared/ui/widgets/loading_widget.dart';

import '../view_models/dailypoints_view_models.dart';

class DailypointsListScreen extends ConsumerWidget {
  const DailypointsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getAllDailypointsViewModelProvider);
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

              var pointDescription = tr('dailypoints.veryBad');
              Color pointColor = Colors.red;
              if(dailypoint.point == 2){
                pointDescription = tr('dailypoints.bad');
                pointColor = Colors.orange;
              }else if(dailypoint.point == 3){
                pointDescription = tr('dailypoints.normal');
                pointColor = Colors.yellow;
              }else if(dailypoint.point == 4){
                pointDescription = tr('dailypoints.good');
                pointColor = Colors.blue;
              }else if(dailypoint.point == 5){
                pointDescription = tr('dailypoints.veryGood');
                pointColor = Colors.green;
              }
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
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
                      style: Theme.of(context).textTheme.bodySmall),
                  trailing: Text(pointDescription, style: TextStyle(color: pointColor),),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
