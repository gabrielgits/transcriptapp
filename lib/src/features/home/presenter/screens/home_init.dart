import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/core/presenter/widgets/loading_widget.dart';

import '../controllers/controller_configs.dart';
import 'landing_screen.dart';
import 'home_screen.dart';

class HomeInit extends ConsumerWidget {
  const HomeInit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(controllerConfigsProvider);
    return controller.when(
      loading: () => const Scaffold(body: Center(child: LoadingWidget())),
      error: (error, _) => ShowErrorView(
        title: 'Error on Login',
        detail: error.toString(),
        onPressed: () => {},
      ),
      data: (config) {
        if (config.id > 0) {
          return const HomeScreen();
        }
        return LandingScreen(
          started: () async {
            await ref
                .read(controllerConfigsProvider.notifier)
                .createConfig();
            if (context.mounted) {
             context.pushReplacement('/home');
            }
                
          },
        );
      },
    );
  }
}
