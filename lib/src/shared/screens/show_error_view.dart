import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ftcontrol/ftcontrol.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/ui/view_models/auth_view_model.dart';

class ShowErrorView extends ConsumerWidget {
  const ShowErrorView({
    super.key,
    required this.detail,
    required this.title,
    this.buttonText = 'Refresh',
    required this.onPressed,
  });
  final String detail;
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        FtcontrolView(
          text: tr('messages.logoutMsn'),
          type: FtcontrolType.warning,
        ),
        const SizedBox(height: 16),
        BformButton(
          label: tr('messages.logoutBtn'),
          fontSize: 16,
          colors: [Theme.of(context).primaryColor],
          onPressed: () {
            context.replaceNamed('login');
            ref.read(authViewModelProvider.notifier).logout();
          },
        ),
      ],
    );
  }
}
