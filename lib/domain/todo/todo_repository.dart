import 'package:todo/domain/todo/models/todo_model.dart';

abstract class ToDoRepository {
  Future<void> setNewToDo(String name, String time, bool isToday);

  Future<List<ToDoModel>> getAllToDosToday();
}
