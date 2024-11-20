import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  ChangePasswordViewState createState() => ChangePasswordViewState();
}

class ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecSenha = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    tecEmail.dispose();
    tecSenha.dispose();
  }

  @override
  build(BuildContext context) {
    const space = 20.0;
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
                    const Text(
                      'User Name',
                    ),
                    const SizedBox(height: space),
                    const BformDivider(),
                    BformTextInput(
                      label: tr('changePwd.password'),
                      textInputType: TextInputType.visiblePassword,
                      //onChange: userViewModel.setPassword,
                      obscureText: true,
                      icon: const Icon(Icons.lock),
                      controller: tecSenha,
                    ),
                    const SizedBox(height: space),
                    BformTextInput(
                      label: tr('changePwd.newPassword'),
                      textInputType: TextInputType.visiblePassword,
                      //onChange: userViewModel.setPassword,
                      obscureText: true,
                      icon: const Icon(Icons.lock_clock_outlined),
                      controller: tecSenha,
                    ),
                    const SizedBox(height: space),
                    BformTextInput(
                      label: tr('changePwd.confirmPassword'),
                      textInputType: TextInputType.visiblePassword,
                      //onChange: userViewModel.setPassword,
                      obscureText: true,
                      icon: const Icon(Icons.lock_clock_sharp),
                      controller: tecSenha,
                    ),
                    const SizedBox(height: space),
                    BformButton(
                      //style: BformButtonStyle.highlighted,
                      label: tr('changePwd.btnChange'),
                      colors: [
                        Theme.of(context).colorScheme.secondary,
                      ],
                      textColor: Colors.white,
                      fontSize: 20,
                      onPressed: () {},
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
  }
}
