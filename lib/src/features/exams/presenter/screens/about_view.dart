import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:transcriptapp/src/core/constants.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  AboutViewState createState() => AboutViewState();
}

class AboutViewState extends State<AboutView> {
  @override
  build(BuildContext context) {
    const space = 10.0;
    return Scaffold(
      appBar: AppBar(title: Text(tr('about.title'))),
      body: Column(
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
            tr('about.subtitle'),
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: space,
          ),
          Padding(
            padding: const EdgeInsets.all(space),
            child: BformForm(
              background: Theme.of(context).colorScheme.secondary,
              child: Column(
                children: [
                  const Text(
                    '${AppConstants.name} ver. ${AppConstants.version} by ${AppConstants.dev}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: space),
                  const BformDivider(),
                  const SizedBox(height: space),
                  const Text(AppConstants.describe),
                  const SizedBox(height: space),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        tr('about.storeAvaliation'),
                        style: const TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                  ),
                  const SizedBox(height: space),
                  const Text(AppConstants.copyrith,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      )),
                  const SizedBox(height: space),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
