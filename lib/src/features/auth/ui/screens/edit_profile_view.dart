import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/features/auth/domain/models/course_model.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';

import '../widgets/profile_widget.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  EditProfileViewState createState() => EditProfileViewState();
}

class EditProfileViewState extends State<EditProfileView> {
  final user = StudentModel(
    id: 1,
    photo:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Sarah Abs',
    phone: '',
    status: 'active',
    course: CourseModelModel.init(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('editProfile.title')),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.photo,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          BformTextInput(
            label: 'Full Name',
            defaultValue: user.name,
            onChange: (name) {},
          ),
          const SizedBox(height: 24),
          BformTextInput(
            label: 'Email',
            defaultValue: user.phone,
            onChange: (email) {},
          ),
          const SizedBox(height: 24),
          BformTextInput(
            label: 'About',
            defaultValue: user.status == 'active'
                ? 'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.'
                : '',
            onChange: (about) {},
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
