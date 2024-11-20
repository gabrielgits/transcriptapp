import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final String author;
  final String icon;
  final int color;
  final int backgroundColor;

  const GameCard({
    super.key,
    required this.title,
    required this.category,
    required this.description,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    const space = 16.0;
    return Card(
      elevation: 3,
      //margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: Color(backgroundColor),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(icon),
              radius: 32,
              child: Image.asset(icon),
            ),
            const SizedBox(height: space),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(color),
              ),
            ),
            const Spacer(),
            Text(
              '${tr('home.category')}: $category',
              style: TextStyle(
                fontSize: 12,
                color: Color(color),
              ),
            ),
            const SizedBox(height: space),
            Text(
              '${tr('home.author')}: $author',
              style: TextStyle(
                fontSize: 12,
                color: Color(color),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(color),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
