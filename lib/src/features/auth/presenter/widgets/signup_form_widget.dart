import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
    required this.tecEmail,
    required this.tecPassword,
    required this.tecName,
    required this.onSubmit,
    required this.goToLogin,
  });

  final TextEditingController tecEmail;
  final TextEditingController tecPassword;
  final TextEditingController tecName;
  final VoidCallback onSubmit;
  final VoidCallback goToLogin;

  @override
  Widget build(BuildContext context) {
    final tecConfirmPassword = TextEditingController();
    const space = 20.0;
    return BformForm(
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        children: [
          BformTextInput(
            label: tr('signup.name'),
            //onChange: userViewModel.setEmail,
            icon: const Icon(Icons.person),
          ),
          const SizedBox(height: space),
          BformTextInput(
            label: tr('signup.email'),
            textInputType: TextInputType.emailAddress,
            //onChange: userViewModel.setEmail,
            icon: const Icon(Icons.email),
            controller: tecEmail,
          ),
          const SizedBox(height: space),
          BformTextInput(
            label: tr('signup.password'),
            textInputType: TextInputType.visiblePassword,
            //onChange: userViewModel.setPassword,
            obscureText: true,
            icon: const Icon(Icons.lock),
            controller: tecPassword,
          ),
          const SizedBox(height: space),
          BformTextInput(
            label: tr('signup.confirmPassword'),
            textInputType: TextInputType.visiblePassword,
            //onChange: ,
            obscureText: true,
            icon: const Icon(Icons.lock_clock_sharp),
            controller: tecConfirmPassword,
          ),
          const SizedBox(height: space),
          BformButton(
            //style: BformButtonStyle.highlighted,
            label: tr('signup.btnSignUp'),
            colors: [
              Theme.of(context).colorScheme.secondary,
            ],
            textColor: Colors.white,
            fontSize: 20,
            onPressed: onSubmit,
          ),
          const SizedBox(height: space),
          BformDivider(child: Text(tr('signup.or'))),
          const SizedBox(height: space),
          BformButton(
            //style: BformButtonStyle.highlighted,
            label: tr('signup.btnLogin'),
            colors: [
              Theme.of(context).colorScheme.primary,
            ],
            textColor: Colors.white,
            fontSize: 20,
            onPressed: goToLogin,
          ),
        ],
      ),
    );
  }
}
