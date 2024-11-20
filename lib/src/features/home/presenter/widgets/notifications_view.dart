import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cute Notifications'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: NotificationList(),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    // You can replace this with your list of notifications.
    List<String> notifications = [
      'You have a new message!',
      'Reminder: Buy groceries',
      'Congratulations on your achievement!',
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(
          text: notifications[index],
          delay: Duration(milliseconds: index * 200),
        );
      },
    );
  }
}

class NotificationCard extends StatefulWidget {
  final String text;
  final Duration delay;

  const NotificationCard({super.key, required this.text, required this.delay});

  @override
  NotificationCardState createState() => NotificationCardState();
}

class NotificationCardState extends State<NotificationCard> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: const Icon(Icons.notifications, color: Colors.blue),
          title: Text(widget.text),
        ),
      ),
    );
  }
}
