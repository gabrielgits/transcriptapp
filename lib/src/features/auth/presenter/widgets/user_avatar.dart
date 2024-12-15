import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/shared/ui/screens/show_error_view.dart';

import '../controllers/auth_controller.dart';

class UserAvatarWidget extends ConsumerWidget {
  const UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: IconButton(
        icon: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          child: const Icon(Icons.person),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 350,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    _userInfo(
                      context: context,
                      onLogout: () async {
                        await ref
                            .read(usersControllerProvider.notifier)
                            .logout();

                        if (!context.mounted) return;
                        context.replaceNamed('login');
                      },
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.red,
                      ),
                      child: const Icon(Icons.arrow_downward_sharp,
                          color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

_userInfo({
  required BuildContext context,
  required VoidCallback onLogout,
}) {
  const double space = 15;
  return Consumer(builder: (context, ref, child) {
    final controller = ref.watch(usersControllerProvider);

    return controller.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ShowErrorView(
        title: 'Error on Login',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (student) => Column(
        children: [
          const CircleAvatar(
            //backgroundImage: NetworkImage(student.imagePath),
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80'),
            maxRadius: 50,
          ),
          const SizedBox(height: space),
          Text(
            student.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: space),
          // locale change
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/flags/flag_en_us.png'),
                  maxRadius: 25,
                ),
                onTap: () => context.setLocale(const Locale('en', 'US')),
              ),
              InkWell(
                child: const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/flags/flag_pt_pt.png'),
                  maxRadius: 25,
                ),
                onTap: () => context.setLocale(const Locale('pt', 'PT')),
              ),
            ],
          ),
          const SizedBox(height: space),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BformButton(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                label: tr('home.profile'),
                onPressed: () {
                  context.pushNamed('profile', extra: {'student': student});
                },
              ),
              const SizedBox(width: space),
              BformButton(
                colors: [
                  Theme.of(context).colorScheme.errorContainer,
                ],
                label: tr('home.signout'),
                onPressed: onLogout,
              ),
            ],
          ),
        ],
      ),
    );
  });
}
