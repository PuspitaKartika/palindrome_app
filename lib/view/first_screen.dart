import 'package:flutter/material.dart';
import 'package:palindrome_app/view/second_screen/pages/second_screen.dart';
import 'package:palindrome_app/widget/custom_text_field.dart';
import 'package:palindrome_app/widget/main_bottom.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController polindromeController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/ic_photo.png"),
          const SizedBox(
            height: 51,
          ),
          CustomTextField(text: "Name", controller: nameController),
          const SizedBox(
            height: 22,
          ),
          CustomTextField(text: "Palindrome", controller: polindromeController),
          const SizedBox(
            height: 45,
          ),
          MainBottom(onPressed: () {}, text: "CHECK"),
          const SizedBox(
            height: 15,
          ),
          MainBottom(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
              },
              text: "NEXT"),
        ],
      ),
    ));
  }
}
