class Todo {
  String id;
  static const String collictionName = 'todos';
  String title;
  String description;
  DateTime Date;
  bool isDone;

  Todo({required this.description, required this.Date,
    this.isDone = false,
    required this.title, required this.id});

  Todo.fromJson(Map<String, Object?> json)
      : this(
      id: json['id']! as String,
      title: json['title']! as String,
      description: json['description']! as String,
      isDone: json['isDone']! as bool,
      Date: DateTime.fromMillisecondsSinceEpoch(json['Date']! as int,)
  );

  Map<String, Object?> toJson() {
    return {

      'id': id,
      'title': title,
      'description': description,
      'Date': Date.millisecondsSinceEpoch,
      'isDone': isDone,


    };
  }

}