import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/auth/presenter/viewmodels/student_view_model.dart';

import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.student});

  final StudentViewModel student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('profile.title')),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath:
                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
            onClicked: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const EditProfileView()),
              );
            },
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Text(
                student.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 4),
              Text(
                student.subtitle,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          const SizedBox(height: 24),
          Center(
              child: BformButton(
            label: 'Update Profile',
            colors: [Theme.of(context).colorScheme.primary],
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const EditProfileView()),
              );
            },
          )),
          const SizedBox(height: 24),
          const NumbersWidget(),
          const SizedBox(height: 48),
          Text(
            '${student.model.course.name} - ${student.model.course.room} - ${student.model.course.teacher.name}',
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAbout(StudentModel user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
          ],
        ),
      );
}
