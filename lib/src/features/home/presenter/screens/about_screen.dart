import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/config/constants.dart';
import 'package:transcriptapp/src/utils/open_url.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  AboutScreenState createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    double space = 20;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.purpleAccent,
            Colors.amber,
            Colors.blue,
          ])),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 100,
              width: 150,
              child:
                  Image(image: AssetImage('assets/images/icons/app_icon.png')),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${AppConstants.name} ${AppConstants.version}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    AppConstants.describe,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr('home.reviews'),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: space),
                      InkWell(
                          child: Text(AppConstants.suporteContacto,
                              style: Theme.of(context).textTheme.titleSmall),
                          onTap: () =>
                              OpenUrl('tel:${AppConstants.suporteContacto}')),
                      SizedBox(height: space),
                      InkWell(
                          child: Text(AppConstants.suporteEmail,
                              style: Theme.of(context).textTheme.titleSmall),
                          onTap: () =>
                              OpenUrl('mailto:${AppConstants.suporteEmail}')),
                      SizedBox(height: space),
                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: const Text(AppConstants.copyrith),
                          onPressed: () => OpenUrl(AppConstants.suporteLink)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
