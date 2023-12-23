import 'package:flutter/material.dart';
import 'package:palindrome_app/constants/theme.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
          "Third Screen",
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
      body: ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: greyColor,
                ),
              ),
              title: Text(
                "Firstname Lastname",
                style: titleH3,
              ),
              subtitle: Text(
                "email@example.com",
                style: subtitleText,
              ),
            );
          }),
    );
  }
}
