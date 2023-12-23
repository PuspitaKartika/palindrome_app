import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palindrome_app/bloc/get_list_user/get_list_user_cubit.dart';
import 'package:palindrome_app/constants/theme.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetListUserCubit>().fetchData(1);
  }

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
      body: BlocBuilder<GetListUserCubit, GetListUserState>(
        builder: (context, state) {
          if (state is GetListUserSuccess) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.data.data?.length,
                itemBuilder: (context, index) {
                  final item = state.data.data![index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {},
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
                });
          } else if (state is GetListUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetListUserFailure) {
            return Text(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
