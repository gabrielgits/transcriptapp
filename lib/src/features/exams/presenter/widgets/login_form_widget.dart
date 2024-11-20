import 'package:alertshow/alertshow.dart';
import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/core/presenter/widgets/loading_widget.dart';

import '../controllers/auth_controller.dart';

class LoginFormWidgets extends ConsumerWidget {
  const LoginFormWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;
    final tecEmail = TextEditingController();
    final tecPassword = TextEditingController();

    final userNotifier = ref.watch(usersControllerProvider);
    return BformForm(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      child: userNotifier.when(
        loading: () => const Center(child: LoadingWidget()),
        error: (error, _) => ShowErrorView(
          title: 'Error on Login',
          detail: error.toString(),
          onPressed: () => {},
        ),
        data: (value) {
          return Column(
            children: [
              BformTextInput(
                label: tr('profile.phone'),
                textInputType: TextInputType.emailAddress,
                icon: const Icon(Icons.email),
                controller: tecEmail,
                hintText: 'Ex: jhon@email.com',
              ),
              const SizedBox(height: space),
              BformTextInput(
                label: tr('profile.password'),
                textInputType: TextInputType.visiblePassword,
                icon: const Icon(Icons.password),
                controller: tecPassword,
              ),
              const SizedBox(height: space),
              BformButton(
                //style: BformButtonStyle.highlighted,
                label: tr('login.btnLogin'),
                colors: [
                  Theme.of(context).colorScheme.primary,
                ],
                textColor: Colors.white,
                fontSize: 20,
                onPressed: () async {
                  /*
                  await ref
                      .read(usersControllerProvider.notifier)
                      .signinWithEmail(
                        email: tecEmail.text.trim(),
                        password: tecPassword.text.trim(),
                      );
                  */
                },
              ),
              const SizedBox(height: space),
              BformDivider(child: Text(tr('login.or'))),
              const SizedBox(height: space),
              BformButton(
                label: tr('login.google'),
                style: BformButtonStyle.outlined,
                iconAsset: 'assets/images/icons/google.png',
                colors: const [Colors.red],
                fontSize: 22,
                onPressed: () async {
                  final resultSigninWithGoogle = await ref
                      .read(usersControllerProvider.notifier)
                      .signinWithPhone(phone: 'test', password: 'text',);
                  
                  if (context.mounted && resultSigninWithGoogle) {
                      alertshowSnackbar(
                        context: context,
                        type: AlertshowType.danger,
                        message: tr('login.failed'),
                      );
                    }
                
                },

                // width: MediaQuery.of(context).size.width * 0.80,
              ),
              const SizedBox(height: space),
              BformButton(
                label: tr('login.facebook'),
                style: BformButtonStyle.outlined,
                onPressed: () {
                  ///handleGoogleSignIn();
                },
                iconAsset: 'assets/images/icons/facebook.png',
                colors: const [Colors.blue],
                fontSize: 22,
                // width: MediaQuery.of(context).size.width * 0.80,
              ),
              const SizedBox(height: space),
            ],
          );
        },
      ),
    );
  }
}
