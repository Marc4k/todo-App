import 'models/todo_model.dart';

abstract class ToDoRepository {
  Future<void> setNewToDo(
      {required String name, required String time, required bool isToday});
  Future<List<ToDoModel>> getAllToDos({required bool isToday});
  Future<void> checkToDo(
      {required int id, required bool isToday, required bool isCheked});

  Future<void> deleteToDo({required int id, required bool isToday});

  Future<void> deleteAll();
}
