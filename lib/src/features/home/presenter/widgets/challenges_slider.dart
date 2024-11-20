import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ChallengesSlider extends StatelessWidget {
  const ChallengesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100,
        aspectRatio: 4.0,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: ListTile(
                leading: Image.asset("assets/images/icons/app_icon.png"),
                title: Text(
                  "The Lord of the Rings: The Fellowship of the Ring",
                  style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Adventure", style: TextStyle(color: Colors.white)),
                    Icon(Icons.play_arrow, color: Theme.of(context).colorScheme.onSecondary),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
