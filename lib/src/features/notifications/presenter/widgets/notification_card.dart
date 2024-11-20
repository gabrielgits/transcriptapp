import 'package:flutter/material.dart';

import '../../domain/models/notification_model.dart';
import 'notification_details.dart';

class NotificationCard extends StatefulWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  IconData _getIconForType(String type) {
    switch (type) {
      case 'message':
        return Icons.message;
      case 'reminder':
        return Icons.notifications_active;
    }
    return Icons.device_unknown;
  }

  NotificationModel notification = NotificationModel(
    id: 1,
    title: '',
    text: '',
    state: '',
    type: '',
    date: DateTime.now(),
  );

  @override
  void initState() {
    super.initState();
    notification = widget.notification;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: ExpansionTile(
        leading: Icon(_getIconForType(notification.type)),
        title: Text(notification.title),
        subtitle: Text(notification.date.toLocal().toString()),
        collapsedBackgroundColor:
            notification.state == 'unread' ? Colors.yellow : null,
        //textColor: style['color'],
        children: [NotificationDetails(notification: notification)],
        onExpansionChanged: (value) {
          if (value) {
            setState(() {
              notification = notification.copyWith(state: 'read');
            });
          }
        },
      ),
    );
  }
}
