import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/features/auth/ui/view_models/auth_view_model.dart';
import 'package:transcriptapp/src/shared/ui/screens/show_error_view.dart';
import 'package:transcriptapp/src/shared/ui/widgets/loading_widget.dart';

import '../../../attendances/ui/widgets/numbers_widget.dart';
import '../widgets/profile_widget.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(authViewModelProvider.notifier).getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('profile.title')),
      ),
      body: controller.when(
        loading: () => const Center(child: LoadingWidget()),
        error: (error, _) => ShowErrorView(
          title: 'Error on get profile',
          detail: error.toString(),
          onPressed: () => {},
        ),
        data: (student) => SingleChildScrollView(
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
                    student.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    student.phone,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${student.course.name} - ${student.course.room}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${tr('profile.teacher')}: ${student.course.teacher.name}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                  child: BformButton(
                label: tr('profile.changePassword'),
                colors: [Theme.of(context).colorScheme.secondary],
                textColor: Theme.of(context).colorScheme.surface,
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
      ),
    );
  }
}
