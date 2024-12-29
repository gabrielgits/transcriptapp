import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/shared/screens/show_error_view.dart';
import 'package:transcriptapp/src/features/home/ui/widgets/rating_bar_widget.dart';

import '../view_models/dailypoints_view_models.dart';

class DailypointReportWidget extends ConsumerWidget {
  const DailypointReportWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;
    final controller = ref.watch(getReportDailypointsViewModelProvider);

    return controller.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ShowErrorView(
        title: 'Error on get dailypoints',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (dailypoints) {
        return InkWell(
          onTap: () {
            context.pushNamed('dailypoints');
          },
          child: Column(
            children: [
              Text(tr('home.dailyPoint'),
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: space / 2),
              RatingBar(
                rating: dailypoints.average,
                ratingCount: dailypoints.countAll,
                size: 30,
              ),
            ],
          ),
        );
      },
    );
  }
}
