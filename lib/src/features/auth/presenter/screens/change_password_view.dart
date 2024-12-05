import 'package:alertshow/alertshow.dart';
import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_controller.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({super.key});

  @override
  ChangePasswordViewState createState() => ChangePasswordViewState();
}

class ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  TextEditingController tecOldPassword = TextEditingController();
  TextEditingController tecNewPassword = TextEditingController();
  TextEditingController tecConfirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    tecOldPassword.dispose();
    tecNewPassword.dispose();
  }

  @override
  build(BuildContext context) {
    const space = 20.0;

    final controller = ref.watch(usersControllerProvider);

    return controller.when(
        loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, _) => Scaffold(body: Text(error.toString())),
        data: (student) {
          return Scaffold(
            appBar: AppBar(title: Text(tr('changePwd.title'))),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: space,
                  ),
                  Text(
                    tr('changePwd.subtitle'),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: space,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(space),
                    child: BformForm(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Column(
                        children: [
                          Text(student.title),
                          const SizedBox(height: space),
                          const BformDivider(),
                          BformTextInput(
                            label: tr('changePwd.oldPassword'),
                            textInputType: TextInputType.visiblePassword,
                            //onChange: userViewModel.setPassword,
                            obscureText: true,
                            icon: const Icon(Icons.lock),
                            controller: tecOldPassword,
                          ),
                          const SizedBox(height: space),
                          BformTextInput(
                            label: tr('changePwd.newPassword'),
                            textInputType: TextInputType.visiblePassword,
                            //onChange: userViewModel.setPassword,
                            obscureText: true,
                            icon: const Icon(Icons.lock_clock_outlined),
                            controller: tecNewPassword,
                          ),
                          const SizedBox(height: space),
                          BformTextInput(
                            label: tr('changePwd.confirmPassword'),
                            textInputType: TextInputType.visiblePassword,
                            //onChange: userViewModel.setPassword,
                            obscureText: true,
                            icon: const Icon(Icons.lock_clock_sharp),
                            controller: tecConfirmPassword,
                          ),
                          const SizedBox(height: space),
                          BformButton(
                            //style: BformButtonStyle.highlighted,
                            label: tr('changePwd.btnChange'),
                            colors: [
                              Theme.of(context).colorScheme.primary,
                            ],
                            textColor: Theme.of(context).colorScheme.surface,
                            fontSize: 20,
                            onPressed: () async {
                              if (tecNewPassword.text !=
                                  tecConfirmPassword.text) {
                                alertshowSnackbar(
                                  context: context,
                                  message: tr('changePwd.notMatch'),
                                  type: AlertshowType.warning,
                                );
                                return;
                              }

                              String message = await ref
                                  .read(usersControllerProvider.notifier)
                                  .changePassword(
                                    oldPassword: tecOldPassword.text,
                                    newPassword: tecNewPassword.text,
                                  );
                              if (!context.mounted) {
                                return;
                              }

                              tecOldPassword.clear();
                              tecNewPassword.clear();
                              tecConfirmPassword.clear();

                              if (message != 'changed') {
                                alertshowSnackbar(
                                  context: context,
                                  message: message,
                                  type: AlertshowType.danger,
                                );
                                return;
                              }
                              
                              alertshowSnackbar(
                                context: context,
                                message: tr('changePwd.success'),
                              );
                              context.pop();
                            },
                          ),
                          const SizedBox(height: space),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
