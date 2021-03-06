import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_demo/users_list/views/add_user_screen.dart';
import 'package:mvvm_demo/users_list/views/users_details_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => const UserDetailsScreen()));
}


void openAddUser(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => const AddUserScreen()));
}
