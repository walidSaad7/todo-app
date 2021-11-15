import 'package:flutter/material.dart';
import 'package:todoapp/todo_list.dart';
import 'package:todoapp/todo_settings.dart';

import 'addTask.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('To DO List'),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: CurrentIndex,
          onTap: (Index) {
            CurrentIndex = Index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(label: '', icon: Icon(Icons.list)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.settings)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: Colors.white,
                width: 4
            )
        ),
        child: Icon(Icons.add),
        onPressed: (){
          AddTodoSheet();

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ShowBottomBarItems(),
    );
  }
  Widget ShowBottomBarItems(){
    if(CurrentIndex==0){
      return TodoList();
    }
    else{
      return TodoSettings();
    }
  }
  AddTodoSheet(){
    return showModalBottomSheet(context: context, builder: (buildContext){
      return AddTask();
    });
  }
}


