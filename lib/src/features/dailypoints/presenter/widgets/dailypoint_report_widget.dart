import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/features/home/presenter/widgets/rating_bar_widget.dart';

import '../controllers/dailypoints_controller.dart';

class DailypointReportWidget extends ConsumerWidget {
  const DailypointReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;
    final controller = ref.watch(getReportDailypointsProvider);

    return controller.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ShowErrorView(
        title: 'Error on get dailypoints',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (dailypoints) {
        double point = dailypoints['average'] == null ? 0 : dailypoints['average'].toDouble();
        
        return InkWell(
          onTap: () {
            context.pushNamed('dailypoints');
          },
          child: Column(
              children: [
                Text(tr('home.dailyPoint'),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: space / 2),
                RatingBar(rating: point, ratingCount: dailypoints['countAll'], size: 30),
              ],
            ),
        );
      },
    );
  }
}
