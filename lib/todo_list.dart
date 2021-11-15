import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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
          Expanded(child: ListView.builder(itemBuilder: (buildContext,index){
            return TodoWedgit();
          },itemCount: 10,
          )




          )


        ],
      ),
    );
  }
}
