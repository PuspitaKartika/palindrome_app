import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_app/bloc/polindrome/polindrome_cubit.dart';
import 'package:palindrome_app/constants/theme.dart';
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
  String? nameError;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    polindromeController.dispose();
  }

  void reset() {
    polindromeController.clear();
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
          CustomTextField(
            text: "Name",
            controller: nameController,
            errorText: nameError,
          ),
          const SizedBox(
            height: 22,
          ),
          CustomTextField(text: "Palindrome", controller: polindromeController),
          const SizedBox(
            height: 45,
          ),
          BlocListener<PolindromeCubit, PolindromeState>(
              listener: (context, state) {
                if (state is PolindromeSuccess) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  state.msg,
                                  style: titleH3,
                                )),
                          ));
                  reset();
                } else if (state is PolindromeFailure) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          content: Container(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                state.msg,
                                style: titleH3,
                              ))));
                  reset();
                }
              },
              child: MainBottom(
                  onPressed: () {
                    context
                        .read<PolindromeCubit>()
                        .checkPalindrome(polindromeController.text);
                  },
                  text: "CHECK")),
          const SizedBox(
            height: 15,
          ),
          MainBottom(
              onPressed: () {
                if (validate()) {
                  return;
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              name: nameController.text,
                            )));
              },
              text: "NEXT"),
        ],
      ),
    ));
  }

  bool validate() {
    bool isError = false;
    setState(() {
      nameError = null;

      if (nameController.text == "") {
        nameError = "Name cannot empty";
        isError = true;
      }
    });
    return isError;
  }
}
