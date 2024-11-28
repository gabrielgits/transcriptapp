import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/core/helpers/open_url.dart';


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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '${AppConstants.name} ${AppConstants.version}',
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
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
                        tr('home.support'),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: space),
                      InkWell(
                          child: const Text(AppConstants.suporteContacto,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue)),
                          onTap: () => OpenUrl(
                              'tel:${AppConstants.suporteContacto}')),
                      SizedBox(height: space),
                      InkWell(
                          child: const Text(AppConstants.suporteEmail,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue)),
                          onTap: () =>
                              OpenUrl('mailto:${AppConstants.suporteEmail}')),
                      SizedBox(height: space),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: const Text(AppConstants.copyrith,
                            style: TextStyle(fontSize: 12)),
                        onPressed: () =>
                              OpenUrl(AppConstants.suporteLink)
                      ),
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
