import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/HomeScreen.dart';
import 'package:todoapp/todo_list.dart';
import 'package:todoapp/todo_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: const Color.fromARGB(255, 223, 236, 219),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 25, color: Colors.black),
          headline2: TextStyle(fontSize: 25, color: Colors.grey),
        ),
      ),
      routes: {
        HomeScreen.routName: (buildContext) => HomeScreen(),
        TodoSettings.routName: (buildContext) => TodoSettings(),
        TodoList.routName: (buildContext) => TodoList(),
      },
      initialRoute: HomeScreen.routName,
    );
  }
}
