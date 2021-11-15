import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWedgit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane:SlidableDrawerActionPane() ,


      child: Container(
        height: 120,
        color: Colors.white,
        padding: EdgeInsets.all(12),
        margin:  EdgeInsets.symmetric(vertical: 12),
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
                Text('Title',style: Theme.of(context).textTheme.headline1,),
                Text('Subtitle',style: Theme.of(context).textTheme.headline2,),
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
          color: Colors.transparent,
          iconWidget: Container(


            margin:  EdgeInsets.symmetric(vertical: 12),

            color: Colors.red,
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
}