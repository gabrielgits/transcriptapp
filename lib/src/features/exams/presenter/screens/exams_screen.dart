import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // list of exams
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/icons/default_game.png'),
            ),
            title: Text('Exam Number ${index + 1}'),
            subtitle: const Text('Date: 01/01/2023 - Type: Avalition',
                style: TextStyle(fontSize: 8)),
            trailing: const Icon(Icons.arrow_circle_right_outlined)
          ),
        );
      },
    );
  }
}
