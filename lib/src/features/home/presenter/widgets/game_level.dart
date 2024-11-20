import 'package:flutter/material.dart';

class GameStatus extends StatelessWidget {
  const GameStatus({super.key, required this.level, required this.color});

  final int level;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Level: $level",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(color),
          ),
        ),
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            value: level / 4, // Assuming level can be 1, 2, 3, or 4
            strokeWidth: 5,
            // backgroundColor: ,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
