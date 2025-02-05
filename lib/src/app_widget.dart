import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/core/app_routes.dart';

import 'shared/theme/color_schemes.g.dart';
import 'core/constants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: AppConstants.debug,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: AppConstants.name,
      routerDelegate: appRoutes.routerDelegate,
      routeInformationParser: appRoutes.routeInformationParser,
      routeInformationProvider: appRoutes.routeInformationProvider,
    );
  }

}
