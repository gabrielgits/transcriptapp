import 'package:alertshow/alertshow.dart';
import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/utils/responsive_helper.dart';
import 'package:transcriptapp/src/shared/ui/screens/show_error_view.dart';
import 'package:transcriptapp/src/shared/ui/widgets/loading_widget.dart';

import '../controllers/auth_controller.dart';

class LoginFormWidgets extends ConsumerWidget {
  const LoginFormWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const space = 10.0;
    final tecPhone = TextEditingController();
    final tecPassword = TextEditingController();

    final userNotifier = ref.watch(usersControllerProvider);
    return BformForm(
      width: ResponsiveHelper.isMobile(context) ? null : 400,
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
                label: tr('login.phone'),
                textInputType: TextInputType.phone,
                icon: const Icon(Icons.phone),
                controller: tecPhone,
                hintText: 'Ex: 923123456',
              ),
              const SizedBox(height: space),
              BformTextInput(
                obscureText: true,
                label: tr('login.password'),
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
                textColor: Theme.of(context).colorScheme.surface,
                fontSize: 20,
                onPressed: () async {
                  final result = await ref
                      .read(usersControllerProvider.notifier)
                      .signinWithPhone(
                        phone: tecPhone.text.trim(),
                        password: tecPassword.text.trim(),
                      );
                  String studentName = ref.watch(usersControllerProvider).value!.title;
                  if (context.mounted) {
                    if (result) {
                      alertshowSnackbar(
                        context: context,
                        message: tr(
                          'msn.welcomeBack',
                          namedArgs: {'student': studentName},
                        ),
                      );
                      context.goNamed('home');
                    } else {
                      alertshowSnackbar(
                        type: AlertshowType.warning,
                        context: context,
                        message: tr('login.failed'),
                      );
                    }
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
