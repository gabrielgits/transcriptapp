import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';

import '../widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';
import 'edit_profile_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    const user = StudentModel(
      id: 1,
      photo:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
      name: 'Sarah Abs',
      phone: 'sarah.abs@gmail.com',
      status: 1,
      courseId: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('profile.title')),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.photo,
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
                user.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 4),
              Text(
                user.phone,
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
            user.status == 1 ? 'Personal Trainer' : 'Nutritionist',
            style: const TextStyle(fontSize: 16, height: 1.4),
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
