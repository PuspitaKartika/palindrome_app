import 'package:flutter/material.dart';
import 'package:palindrome_app/constants/theme.dart';
import 'package:palindrome_app/models/user_model.dart';
import 'package:palindrome_app/repositories/user_repo.dart';
import 'package:palindrome_app/view/second_screen/pages/second_screen.dart';
import 'package:simple_infinite_scroll/simple_infinite_scroll.dart';
import 'package:simple_infinite_scroll/simple_infinite_scroll_controller.dart';

class ThirdScreen extends StatelessWidget {
  final String name;
  ThirdScreen({super.key, required this.name});

  final scrollController = ScrollController();

  final SimpleInfiniteScrollController _scrollController =
      SimpleInfiniteScrollController();

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
        body: SimpleInfiniteScroll<UserDataModel>(
            controller: _scrollController,
            fetch: (page, limit) => UserRepo().getUser(page: page),
            loadingWidget: Center(
              child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const CircularProgressIndicator()),
            ),
            itemBuilder: (context, index, item) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen(
                                    name: name,
                                    selected:
                                        "${item.firstName} ${item.lastName}",
                                  )));
                    },
                    leading: ClipOval(
                      child: Image.network(
                        item.avatar ?? "",
                        width: 50,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.person),
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      "${item.firstName} ${item.lastName}",
                      style: titleH3,
                    ),
                    subtitle: Text(
                      item.email ?? "",
                      style: subtitleText,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    height: 1.0,
                  ),
                ],
              );
            }));
  }
}
