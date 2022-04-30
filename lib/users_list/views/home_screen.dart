import 'package:flutter/material.dart';
import 'package:mvvm_demo/users_list/models/users_list_model.dart';
import 'package:mvvm_demo/users_list/view_models/users_view_model.dart';
import 'package:mvvm_demo/users_list/views/widgets/error.dart';
import 'package:mvvm_demo/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('MVVM Demo'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () async {},
            )
          ],
        ),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _ui(usersViewModel),
          ]),
        ));
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const CircularProgressIndicator();
    }
    if (usersViewModel.userError != null) {
      return AppError(errorText: usersViewModel.userError.message.toString());
    }

    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) {
        UserModel userModel = usersViewModel.userListModel[index];
        return InkWell(
          onTap: () {
            usersViewModel.setSelectedUser(userModel);
            openUserDetails(context);
          },
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userModel.name!,
                  style: const TextStyle(color: Colors.black)),
              Text(userModel.email!, style: const TextStyle(color: Colors.grey))
            ],
          )),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: usersViewModel.userListModel.length,
    ));
  }
}
