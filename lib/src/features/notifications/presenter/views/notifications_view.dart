import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/models/notification_model.dart';
import '../widgets/notification_card.dart';

final List<NotificationModel> notifications = [
  NotificationModel(
    title: 'New Message',
    text: 'You have a new message from User 2.',
    state: 'read',
    type: 'message',
    date: DateTime.now(),
    id: 1,
  ),
  NotificationModel(
    id: 2,
    title: 'Reminder',
    text: 'Don\'t forget to buy groceries.',
    state: 'unread',
    type: 'reminder',
    date: DateTime.now(),
  ),
  // Add more notifications here as needed
];

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('notifications.title')),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(notification: notifications[index]);
        },
      ),
    );
  }
}
