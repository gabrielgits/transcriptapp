import 'package:flutter/material.dart';

import '../../domain/models/notification_model.dart';

class NotificationDetails extends StatelessWidget {
  final NotificationModel notification;

  const NotificationDetails({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification.text),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              notification.state,
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
