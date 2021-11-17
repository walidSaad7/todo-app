import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'data/FireStoreUtils.dart';
import 'data/Todo.dart';

class TodoWedgit extends StatelessWidget {
  Todo item;
TodoWedgit(this.item);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane:SlidableDrawerActionPane() ,


      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        height: 120,

        padding: EdgeInsets.all(12),
        margin:   EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 60,
              color: Theme.of(context).primaryColor,

            ),
            SizedBox(
              width: 6,
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,style: Theme.of(context).textTheme.headline1,),
                Text(item.description,style: Theme.of(context).textTheme.headline2,),

              ],
            )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Image.asset('assets/images/Icon awesome-check.png'),
            )

          ],
        ),
      ),
      actions: [
        IconSlideAction(
          onTap: (){
            deleteTodo(item).then((value){

            }).onError((error, stackTrace){
              showmassege('timedout', context);

            });
           showmassege('Task deleted succsesfully', context);


          },
          color: Colors.transparent,
          iconWidget: Container(
            decoration: BoxDecoration(
                color: Colors.red,

                borderRadius: BorderRadius.circular(12)
             
                    
              ),



            margin:  EdgeInsets.symmetric(vertical: 12),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.delete,color: Colors.white,),
                Center(child: Text('Delete',style: TextStyle(
                    color: Colors.white
                ),))
              ],
            ),
          ),
        )
      ],

    );
  }
  void showmassege(String m,context){

      showDialog(context: context, builder: (buildContext){
        return AlertDialog(
          content: Text(m),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(buildContext);
            }, child: Text('ok'))
          ],
        );
      });
  }
}