import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../viewmodels/student_view_model.dart';
import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.student});

  final StudentViewModel student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('profile.title')),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ProfileWidget(
              imagePath:
                  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
              onClicked: () {},
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                Text(
                  student.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 4),
                Text(
                  student.subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  '${student.model.course.name} - ${student.model.course.room}',
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${tr('profile.teacher')}: ${student.model.course.teacher.name}',
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
                child: BformButton(
              label: tr('profile.changePassword'),
              colors: [Theme.of(context).colorScheme.errorContainer],
              onPressed: () {
                context.pushNamed('changepassword');
              },
            )),
            const SizedBox(height: 24),
            const NumbersWidget(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
