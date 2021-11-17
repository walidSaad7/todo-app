import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/data/Todo.dart';


CollectionReference<Todo> getTodoWithConverter(){
 return FirebaseFirestore.instance.collection(Todo.collictionName).
  withConverter<Todo>(fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
  toFirestore: (item, _) => item.toJson());
}
 Future<void>AddTodoToFirestoe(String title,String description,DateTime date){
 CollectionReference<Todo>collections= getTodoWithConverter();
 DocumentReference<Todo> DocRef=collections.doc();


     Todo Item=Todo(description: description, Date: date, title: title, id: DocRef.id

     );
return DocRef.set(Item);

}
Future<void> deleteTodo(Todo item){
  CollectionReference<Todo>collections= getTodoWithConverter();
 DocumentReference<Todo>todo= collections.doc(item.id);
return todo.delete();



}