import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/core/presenter/widgets/custom_appbar_widget.dart';
import 'package:transcriptapp/src/features/attendances/presenter/widgets/attendance_report_widget.dart';
import 'package:transcriptapp/src/features/auth/presenter/widgets/user_avatar.dart';
import 'package:transcriptapp/src/features/dailypoints/presenter/widgets/dailypoint_report_widget.dart';
import 'package:transcriptapp/src/features/exams/presenter/screens/exams_screen.dart';

import '../widgets/session_widget.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppbarWidget(
          title: AppConstants.name,
          actions: [UserAvatarWidget()],
        ),
        body: TabBarView(
          children: [
            HomeView(),
            ExamsScreen(),
            AboutScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.add_chart)),
            Tab(icon: Icon(Icons.info)),
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
              tr('msn.welcome'),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(height: space),
          const SessionWidget(
            height: 170,
            child: AttendanceReportWidget(),
          ),
          const SizedBox(height: space),
          const SessionWidget(
            height: 100,
            child: DailypointReportWidget(),
          ),
          const SizedBox(height: space),
          SessionWidget(
            height: 3 * 100,
            child: Column(
              children: [
                Text(tr('home.examsPoints'),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: space / 2),
                for (int index = 0; index < 3; index++)
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/icons/default_game.png'),
                    ),
                    title: Text('Avalition Number ${index + 1}'),
                    subtitle: const Text('Date: 01/01/2023 - Type: Avalition',
                        style: TextStyle(fontSize: 8)),
                    trailing: Text('10',
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                const SizedBox(height: space / 2),
                Text(
                  "${tr('home.average')} : 10 Points",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: space),
          SessionWidget(
            height: 100,
            child: Column(
              children: [
                Text(tr('home.totalPoints'),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: space / 2),
                Text(
                  "${tr('home.average')} : 10 Points",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
