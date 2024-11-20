import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/mygames_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBarWidget(
          title: '${AppConstants.name} Ver. ${AppConstants.version}',
        ),
        body: TabBarView(
          children: [
            HomeView(),
            ChallengesView(),
            Icon(Icons.directions_bike),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = 20.0;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              tr(AppConstants.describe),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(height: space),
          const MygamesSlider(),
          const SizedBox(height: space),
          BformButton(
            colors: [
              Theme.of(context).colorScheme.inversePrimary,
            ],
            onPressed: () {
              context.pushNamed('gamemaker');
            },
            fontSize: 20,
            label: tr('home.newGame'),
          ),
          const SizedBox(height: space),
        ],
      ),
    );
  }
}

class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<StudentModel> games = [
      StudentModel.init().copyWith(name: 'Game 1'),
      StudentModel.init().copyWith(name: 'Game 2'),
    ];
    return ListView.builder(
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
          subtitle: Text('${games[index].name} / ${games[index].name}'),
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
                            onPressed: () {}, icon: const Icon(Icons.email)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_forever)),
                      ])
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
