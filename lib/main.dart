import 'package:flutter/material.dart';
import 'package:mvvm_demo/users_list/views/home_screen.dart';
import 'package:mvvm_demo/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UsersViewModel()),
      ],
      child: MaterialApp(
        title: 'MVVM',
        theme: ThemeData(
      
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
