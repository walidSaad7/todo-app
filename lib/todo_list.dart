import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todoapp/data/FireStoreUtils.dart';
import 'package:todoapp/data/Todo.dart';
import 'package:todoapp/extenion.dart';
import 'package:todoapp/todo_widget.dart';
class TodoList extends StatefulWidget {
  static const String routName='TodolIST';

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DateTime selectedDay=DateTime.now();

  DateTime focusedDay=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),

      child: Column(
        children: [

          TableCalendar(
              selectedDayPredicate: (day){
                return   isSameDay(day, selectedDay);
              },
              onDaySelected: (SDAY, FDAY) {
                setState(() {
                  selectedDay = SDAY;
                  focusedDay = FDAY; // update `_focusedDay` here as well
                });
              },            calendarFormat: CalendarFormat.week
              ,
              calendarStyle: CalendarStyle(
                selectedTextStyle: TextStyle(
                    color: Colors.white
                ),
                selectedDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(9),


                ),
                todayTextStyle: TextStyle(
                    color: Colors.white
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                ),
                defaultTextStyle:   TextStyle(
                    color: Colors.black
                ),

              ),
              weekendDays: [],
              daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  weekdayStyle: TextStyle(
                      color: Colors.black
                  )
              ),
              focusedDay: focusedDay, firstDay: DateTime.utc(2019), lastDay: DateTime.utc(2030)),


          Expanded(
              child:
              StreamBuilder<QuerySnapshot<Todo>>(
          stream:getTodoWithConverter().snapshots(),

              builder: (BuildContext buildContext, AsyncSnapshot<QuerySnapshot<Todo>> snapshot){
              if(snapshot.hasError){
              Center(child: Text(snapshot.error.toString()));

    }else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());

    }
    List<Todo>items=  snapshot.data!.docs.map((doc)=>doc.data()).toList();
            return ListView.builder(itemBuilder: (buildContext,index){
           return   TodoWedgit(items[index]);

    },itemCount:items.length ,);

    },




          )

          )







        ],
      ),
    );
  }
}
