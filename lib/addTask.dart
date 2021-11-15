import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {

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
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Title'
            ),
          ) ,
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Describtion'
            ),
            minLines: 4,
            maxLines: 5,
          ),
          InkWell(
              onTap: ()=>ShowDate(context),

              child: Text('choose Date!',style: Theme.of(context).textTheme.headline2,)),
          Center(child: Text('1/10/1999',style: TextStyle(
              fontSize: 20
          ),)),
          ElevatedButton(onPressed: (){

          }, child: Text('Add'))
        ],
      ),
    );
  }
  void ShowDate(context){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate:  DateTime.utc(2030));
  }
}