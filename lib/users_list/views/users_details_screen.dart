import 'package:flutter/material.dart';
import 'package:mvvm_demo/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(usersViewModel.selectedUser.name,
                style: const TextStyle(color: Colors.black)),
            Text(usersViewModel.selectedUser.email,
                style: const TextStyle(color: Colors.grey))
          ]),
    );
  }
}
