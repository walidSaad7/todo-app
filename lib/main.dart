import 'package:flutter/material.dart';
import 'package:todoapp/HomeScreen.dart';
import 'package:todoapp/todo_list.dart';
import 'package:todoapp/todo_settings.dart';

void main(){
  runApp(MyApplication());
}
class MyApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
          scaffoldBackgroundColor: Color.fromARGB(255, 223, 236, 219),

        textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: Colors.black
          ),
          headline2: TextStyle(
              fontSize: 25,
              color: Colors.grey
          ),

        ),

      ),
      routes: {
        HomeScreen.routName:(buildContext)=>HomeScreen(),
        TodoSettings.routName:(buildContext)=>TodoSettings(),
        TodoList.routName:(buildContext)=>TodoList(),
      },
      initialRoute: HomeScreen.routName,

    );
  }
}