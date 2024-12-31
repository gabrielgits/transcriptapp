import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/shared/screens/show_error_view.dart';
import 'package:transcriptapp/src/shared/widgets/loading_widget.dart';

import '../view_models/notifications_view_model.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getAllNotificationsViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('notifications.title')),
      ),
      body: controller.when(
        loading: () => const Center(child: LoadingWidget()),
        error: (error, _) => ShowErrorView(
          title: 'Error on get notifications',
          detail: error.toString(),
          onPressed: () => {},
        ),
        data: (notifications) {
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (_, index) => NotificationCard(notification: notifications[index]),
          );
        },
      ),
    );
  }
}
