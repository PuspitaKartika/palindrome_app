import 'package:flutter/material.dart';
import 'package:palindrome_app/constants/theme.dart';

class WelcomeWidget extends StatelessWidget {
  final String name;
  const WelcomeWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: smallText,
        ),
        Text(
          name,
          style: titleH2,
        ),
      ],
    );
  }
}
