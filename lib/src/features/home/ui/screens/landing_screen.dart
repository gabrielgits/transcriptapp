import 'package:bform/bform.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key, required this.started});

  final VoidCallback started;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              autoPlay: true,
            ),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return _slideItem(
                    title: tr('landing.title$i'),
                    imagePath: "assets/images/landing/image$i.png",
                    context: context,
                  );
                },
              );
            }).toList(),
          ),
          BformButton(
            label: tr('landing.btnStart'),
            fontSize: 20,
            colors: [
              Theme.of(context).colorScheme.primary,
            ],
            textColor: Theme.of(context).colorScheme.surface,
            onPressed: started,
          ),
        ],
      ),
    );
  }
}

_slideItem({required String title, required String imagePath, required BuildContext context}) {
  return Container(
    margin: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.grey[200],
    ),
    child: Column(
      children: [
        Image.asset(imagePath, height: 350.0, width: 300.0),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.primary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    ),
  );
}
