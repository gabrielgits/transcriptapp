import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';
import '../widgets/signup_form_widget.dart';

class SignupView extends ConsumerWidget {
  const SignupView({super.key});

  @override
  build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(usersControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(tr('signup.title'))),
      body: controller.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
        data: (value) {
          const space = 20.0;

          TextEditingController tecEmail = TextEditingController();
          TextEditingController tecPassword = TextEditingController();
          TextEditingController tecName = TextEditingController();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: space,
                ),
                Text(
                  tr('signup.subtitle'),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: space,
                ),
                Padding(
                  padding: const EdgeInsets.all(space),
                  child: SignupFormWidget(
                    tecEmail: tecEmail,
                    tecPassword: tecPassword,
                    tecName: tecName,
                    onSubmit: () async {
                      /*
                      return ref
                          .read(usersControllerProvider.notifier)
                          .signUp(
                            name: tecName.text,
                            email: tecEmail.text,
                            password: tecPassword.text,
                          )
                          .then((_) {
                        if (controller.value!.id > 0) {
                          context.go('/home');
                        }
                      });
                    }, */
                    },
                    goToLogin: () => context.pushNamed('/login'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
