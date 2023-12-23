import 'package:flutter/material.dart';
import 'package:palindrome_app/constants/theme.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

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
          "John Doe",
          style: titleH2,
        ),
      ],
    );
  }
}
