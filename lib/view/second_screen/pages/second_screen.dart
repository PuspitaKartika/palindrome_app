import 'package:flutter/material.dart';
import 'package:palindrome_app/constants/theme.dart';
import 'package:palindrome_app/view/second_screen/widget/welcome_widget.dart';
import 'package:palindrome_app/view/third_screen/pages/third_screen.dart';
import 'package:palindrome_app/widget/main_bottom.dart';

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: mainColor,
              size: 16,
            )),
        title: Text(
          "Second Screen",
          style: titleH2,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            color: Colors.grey.withOpacity(0.2),
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeWidget(
              name: widget.name,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Selected User Name",
                  style: titleH1,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32),
        child: MainBottom(
            text: "Choose a User",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()));
            }),
      ),
    );
  }
}
