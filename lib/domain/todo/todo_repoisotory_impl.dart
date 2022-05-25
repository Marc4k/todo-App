import 'package:todo/domain/database/db.dart';
import 'package:todo/domain/todo/models/todo_model.dart';
import 'package:todo/domain/todo/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  @override
  Future<void> setNewToDo(
      {required String name,
      required String time,
      required bool isToday}) async {
    DatabaseService.instance.insertRaw(
        'INSERT INTO todo (${ToDoFields.name}, ${ToDoFields.time}, ${ToDoFields.isChecked}) VALUES("$name", "$time", 0)');
  }

  @override
  Future<List<ToDoModel>> getAllToDosToday() async {
    List<ToDoModel> todosToday = [];

    List<Map> list =
        await DatabaseService.instance.rawQuery('SELECT * FROM $tableToDo');

    for (var i = 0; i < list.length; i++) {
      bool isChecked = false;

      if (list[i]["isChecked"] == 1) {
        isChecked = true;
      } else {
        isChecked = false;
      }

      todosToday.add(ToDoModel(
          id: list[i]["id"],
          name: list[i]["name"],
          time: list[i]["time"],
          isChecked: isChecked));
    }

    return todosToday;
  }

  @override
  Future<void> checkToDo({required int id}) async {
    await DatabaseService.instance
        .rawUpdate('UPDATE $tableToDo SET isChecked = 1 WHERE id = $id');
  }
}
