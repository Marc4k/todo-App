import 'package:todo/domain/todo/models/todo_model.dart';

abstract class ToDoRepository {
  Future<void> setNewToDo(
      {required String name, required String time, required bool isToday});
  Future<List<ToDoModel>> getAllToDosToday();
  Future<void> checkToDo({required int id});
}
