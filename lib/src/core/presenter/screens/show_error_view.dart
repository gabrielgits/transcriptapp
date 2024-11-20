import 'package:bform/bform.dart';
import 'package:flutter/material.dart';
import 'package:ftcontrol/ftcontrol.dart';

class ShowErrorView extends StatelessWidget {
  const ShowErrorView({
    super.key,
    required this.detail,
    required this.title,
    this.buttonText = 'Refresh',
    required this.onPressed,
  });
  final String detail;
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        FtcontrolView(
          text: detail,
          type: FtcontrolType.danger,
        ),
        const SizedBox(height: 16),
        BformButton(
          label: buttonText,
          fontSize: 16,
          colors: [Theme.of(context).primaryColor],
          onPressed: onPressed,
        ),
      ],
    );
  }
}
