import 'package:alertshow/alertshow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/shared/widgets/loading_widget.dart';

import '../view_models/config_view_model.dart';

class LocalesWidget extends ConsumerWidget {
  const LocalesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localesViewModel = ref.watch(configViewModelProvider);

    if (localesViewModel is AsyncLoading) {
      return const Center(child: LoadingWidget());
    } else if (localesViewModel is AsyncError) {
      alertshowSnackbar(
        context: context,
        type: AlertshowType.danger,
        message: tr('config.localeError'),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/flags/flag_en_us.png'),
            maxRadius: 25,
          ),
          onTap: () async {
            const language = 'en';
            _updateLanguageUI(language: language, context: context);
            await ref
                .read(configViewModelProvider.notifier)
                .updateLocale(language);
          },
        ),
        InkWell(
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/flags/flag_pt_pt.png'),
            maxRadius: 25,
          ),
          onTap: () async {
            const language = 'pt';
            _updateLanguageUI(language: language, context: context);
            await ref
                .read(configViewModelProvider.notifier)
                .updateLocale(language);
          },
        ),
      ],
    );
  }

  void _updateLanguageUI(
      {required String language, required BuildContext context}) {
    var locale = const Locale('en', 'US');
    if (language == 'pt') {
      locale = const Locale('pt', 'PT');
    }
    context.setLocale(locale);
  }
}
