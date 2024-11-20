import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';

class MygamesScreen extends StatefulWidget {
  const MygamesScreen({super.key});

  @override
  State<MygamesScreen> createState() => _MygamesScreenState();
}

class _MygamesScreenState extends State<MygamesScreen> {
  List<StudentModel> games = [
    StudentModel.init().copyWith(name: 'Game 1'),
    StudentModel.init().copyWith(name: 'Game 2')
    // Add more games here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('home.mygames')),
      ),
      body: ListView.builder(
          itemCount: games.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              onExpansionChanged: (bool expanded) {
                //setState(() => _customTileExpanded = expanded);
              },
              title: Text(games[index].name),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/icons/default_game.png'),
              ),
              subtitle: Text(games[index].name),
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  child: Column(
                    children: [
                      Text(games[index].name),
                      const SizedBox(height: 16),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit_square)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete_forever)),
                          ])
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
