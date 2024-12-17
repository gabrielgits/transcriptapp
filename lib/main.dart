import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcriptapp/src/core/dependency.dart';

import 'src/app_widget.dart';
import 'src/core/constants.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  if (!AppConstants.debug) {
    EasyLocalization.logger.enableBuildModes = [];
  }

  setupAppStart();

  return runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('pt', 'PT')],
        //supportedLocales: const [Locale('pt', 'PT')],
        path: 'assets/languages',
        fallbackLocale: const Locale('en', 'US'), //const Locale('pt', 'PT'),
        child: const AppWidget(),
      ),
    ),
  );
}
