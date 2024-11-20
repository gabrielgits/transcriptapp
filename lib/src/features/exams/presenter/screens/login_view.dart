import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/presenter/widgets/custom_app_bar_widget.dart';

import '../widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  build(BuildContext context) {
    const space = 10.0;

    return Scaffold(
      appBar: CustomAppbarWidget(
          title: tr('login.title'), onBackPressed: () => context.pop()),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: space,
              ),
              Image.asset(
                'assets/images/icons/app_icon.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: space,
              ),
              Text(
                tr('login.subtitle'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: space,
              ),
              const Padding(
                padding: EdgeInsets.all(space),
                child: LoginFormWidgets(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
