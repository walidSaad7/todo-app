import 'package:flutter/material.dart';

import 'data/FireStoreUtils.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var FormKey=GlobalKey<FormState>();
  DateTime SelectedDate=DateTime.now();
  String title='';
  String description='';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text('Add New Task',style: Theme.of(context).textTheme.headline1,)),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 2,
          ),
          Form(
            key:FormKey ,
              child: Column(
            children: [
              TextFormField(
                  onChanged: (text){
                    title=text;
                  },
                decoration: InputDecoration(
                    labelText: 'Title'
                ),
                     validator: (textValue) {
                       if (textValue == null || textValue.isEmpty) {
                         return 'please enter title';
                       }
                       return null;
                     }
              ) ,

              TextFormField(
                onChanged: (text){
                  description=text;
                },
                decoration: InputDecoration(
                    labelText: 'Description'
                ),
                validator: (textValue){
                  if(textValue==null||textValue.isEmpty){
                    return 'please enter Describtion';
                  }
                  return null;
                },
                minLines: 4,
                maxLines: 5,
              ),

            ],
          )),

          InkWell(
              onTap: ()=>ShowDate(context),

              child: Text('choose Date!',style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 21
              ))),
          Text('Day:',style: TextStyle(
                   fontSize: 20,
                  color: Colors.black
    ),),
          Center(
            child: Text( '${SelectedDate.day}/${SelectedDate.month}/${SelectedDate.year}',style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent
            ),),
          ),

          ElevatedButton(onPressed: (){
            Addtodo();

          }, child: Text('Add')),

        ],
      ),
    );
  }
  void Addtodo(){
    FormKey.currentState?.validate();
    AddTodoToFirestoe(title,description,SelectedDate).then((value){
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      print('Erorr adding task');

    }).timeout(Duration(seconds: 20),onTimeout: (){
      print('timed out');
    });

  }

  void ShowDate(context)async{
  var  newSelectedDate= await
    showDatePicker(context: context,
        initialDate: SelectedDate,
        firstDate: DateTime.now(),
        lastDate:  DateTime.utc(2030));
  SelectedDate=newSelectedDate!;
  setState(() {

  });
  }
}