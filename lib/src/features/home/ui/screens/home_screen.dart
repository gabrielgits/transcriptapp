import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/shared/widgets/custom_appbar_widget.dart';
import 'package:transcriptapp/src/features/attendances/ui/widgets/attendance_report_widget.dart';
import 'package:transcriptapp/src/features/auth/ui/widgets/student_score_widget.dart';
import 'package:transcriptapp/src/features/auth/ui/widgets/user_avatar.dart';
import 'package:transcriptapp/src/features/dailypoints/ui/widgets/dailypoint_report_widget.dart';
import 'package:transcriptapp/src/features/testes/ui/screens/testes_screen.dart';
import 'package:transcriptapp/src/features/testes/ui/widgets/last_testes_widget.dart';

import '../widgets/session_widget.dart';
import 'about_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(configViewModelProvider.notifier).build();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppbarWidget(
          leading: IconButton(
            onPressed: () => context.pushNamed('notifications'),
            icon: const Icon(Icons.notifications),
          ),
          title: AppConstants.name,
          actions: const [UserAvatarWidget()],
        ),
        body: const TabBarView(
          children: [
            HomeView(),
            TestesListScreen(),
            AboutScreen(),
          ],
        ),
        bottomNavigationBar: const TabBar(
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
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              AppConstants.schoolName,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
          SessionWidget(
            height: 180,
            child: Column(
              children: [
                const AttendanceReportWidget(),
                const Spacer(),
                Text(
                  tr('home.touch'),
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(height: space),
          SessionWidget(
              height: 120,
              child: Column(
                children: [
                  const DailypointReportWidget(),
                  const Spacer(),
                  Text(
                    tr('home.touch'),
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              )),
          const SizedBox(height: space),
          const SessionWidget(
            height: 3 * 120,
            child: LastTestesWidget(),
          ),
          const SizedBox(height: space),
          const SessionWidget(
            height: 180,
            child: StudentScoreWidget(),
          ),
        ],
      ),
    );
  }
}
