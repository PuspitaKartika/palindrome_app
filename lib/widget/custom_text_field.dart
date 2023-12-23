import 'package:flutter/material.dart';
import 'package:palindrome_app/constants/theme.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String? errorText;
  const CustomTextField(
      {super.key,
      required this.text,
      required this.controller,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        filled: true,
        hintText: text,
        hintStyle: titleH3.copyWith(color: greyColor.withOpacity(0.36)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
