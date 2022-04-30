import 'package:flutter/material.dart';
import 'package:mvvm_demo/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel _userViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add user'),
        actions: [
          IconButton(
              onPressed: () async {
                bool userAdded = await _userViewModel.addUser();
                if (!userAdded) {
                  return;
                }
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(height: 20.0),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Name'),
            onChanged: (val) async {
              _userViewModel.addingUser.name = val;
            },
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Email'),
            onChanged: (val) async {
              _userViewModel.addingUser.email = val;
            },
          )
        ]),
      ),
    );
  }
}
