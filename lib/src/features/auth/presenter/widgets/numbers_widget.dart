import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/user_attendances_controller.dart';

class NumbersWidget extends ConsumerWidget {
  const NumbersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getUserAttendancesProvider);
    return controller.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => const Text('Error on get attendances'),
        data: (attendances) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton(
                context,
                attendances['countPresent'].toString(),
                tr('profile.countPresent'),
              ),
              buildDivider(),
              buildButton(
                context,
                attendances['countAbsent'].toString(),
                tr('profile.countAbsent'),
              ),
              buildDivider(),
              buildButton(
                context,
                (attendances['countPresent'] + attendances['countAbsent'])
                    .toString(),
                tr('profile.countAll'),
              ),
            ],
          );
        });
  }

  Widget buildDivider() {
    return const SizedBox(
      height: 24,
      child: VerticalDivider(),
    );
  }

  Widget buildButton(BuildContext context, String value, String text) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 2),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
