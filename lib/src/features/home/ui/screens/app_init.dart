import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/shared/screens/show_error_view.dart';
import 'package:transcriptapp/src/shared/widgets/loading_widget.dart';
import 'package:transcriptapp/src/features/auth/ui/screens/login_screen.dart';

import 'landing_screen.dart';
import 'home_screen.dart';

class AppInit extends ConsumerWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(configViewModelProvider);
    return controller.when(
      loading: () => const Scaffold(body: Center(child: LoadingWidget())),
      error: (error, _) => ShowErrorView(
        title: 'Error on Login',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (config) {
        if (config.id > 0) {
          //changeLocale(locale: config.language, context: context);
          if (config.studentId > 0) {
            return const HomeScreen();
          }
           return const LoginScreen();
        }
        return LandingScreen(
          started: () async {
            await ref
                .read(configViewModelProvider.notifier)
                .createConfig();
            if (context.mounted) {
             context.replaceNamed('login');
            }             
          },
        );
      },
    );
  }
}
