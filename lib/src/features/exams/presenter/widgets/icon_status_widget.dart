import 'package:flutter/material.dart';

class IconStatusWidget extends StatelessWidget {
  const IconStatusWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    var icon = Icons.timer;
    var color = Colors.orange;
    if (status == 'ongoing' || status == 'started') {
      icon = Icons.timelapse;
      color = Colors.yellow;
    } else if (status == 'submitted' || status == 'sended') {
      icon = Icons.send;
      color = Colors.blue;
    } else if (status == 'done' || status == 'finished') {
      icon = Icons.done_all;
      color = Colors.green;
    } else if (status == 'missed' || status == 'absent') {
      icon = Icons.close;
      color = Colors.red;
    }
    return Icon(icon, color: color);
  }
}
