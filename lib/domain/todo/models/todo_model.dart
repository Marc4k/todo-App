final String tableToDo = "todo";

class ToDoFields {
  static final String id = 'id';
  static final String name = "name";
  static final String time = "time";
  static final String isChecked = "isChecked";
}

class ToDoModel {
  final int id;
  final String name;
  final String time;
  final bool isChecked;

  ToDoModel(
      {required this.id,
      required this.name,
      required this.time,
      required this.isChecked});
}
