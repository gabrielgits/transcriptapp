import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/core/presenter/widgets/loading_widget.dart';

import '../controllers/auth_controller.dart';
import '../viewmodels/student_view_model.dart';

class UserAvatarWidget extends ConsumerWidget {
  const UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(usersControllerProvider);

    return controller.when(
      loading: () => const Center(child: LoadingWidget()),
      error: (error, _) => ShowErrorView(
        title: 'Error on Login',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (user) {
        Widget iconWidget = CircleAvatar(
          backgroundColor: Colors.red[200],
          child: const Icon(Icons.person),
        );
        if (user.id > 0) {
          iconWidget = CircleAvatar(
            backgroundImage: NetworkImage(user.imagePath),
          );
        }

        return Container(
          margin: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: iconWidget,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 350,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        user.id == 0
                            ? _userAnonymous(context)
                            : _userInfo(user, context, () async {
                                await ref
                                    .read(usersControllerProvider.notifier)
                                    .logout();

                                if (!context.mounted) return;
                                context.pop();
                              }),
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
      },
    );
  }
}

_userInfo(StudentViewModel user, BuildContext context, VoidCallback onLogout) {
  const double space = 15;
  return Column(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(user.imagePath),
        maxRadius: 50,
      ),
      const SizedBox(height: space),
      Text(
        user.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: space),
      Text(user.subtitle),
      const SizedBox(height: space),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BformButton(
            colors: [
              Theme.of(context).colorScheme.primary,
            ],
            label: tr('home.profile'),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          const SizedBox(width: space),
          BformButton(
            colors: [
              Theme.of(context).colorScheme.secondary,
            ],
            label: tr('home.signout'),
            onPressed: onLogout,
          ),
        ],
      ),
    ],
  );
}

_userAnonymous(BuildContext context) {
  const double space = 15;
  return Column(
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage('assets/images/tchissola/tchissola8.png'),
        maxRadius: 50,
      ),
      const SizedBox(height: space),
      Text(tr('home.noAccount'),
          softWrap: true,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20)),
      const SizedBox(height: space),
      BformButton(
        colors: [
          Theme.of(context).colorScheme.secondaryContainer,
        ],
        label: tr('home.signin'),
        fontSize: 18,
        onPressed: () {
          context.pop();
          context.pushNamed('signin');
        },
      ),
    ],
  );
}
