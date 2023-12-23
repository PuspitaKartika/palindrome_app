import 'package:flutter/material.dart';
import 'package:palindrome_app/constants/theme.dart';

class MainBottom extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const MainBottom({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: regulerText.copyWith(color: Colors.white),
          )),
    );
  }
}
