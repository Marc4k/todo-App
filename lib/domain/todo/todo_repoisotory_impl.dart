import 'package:todo/domain/database/db.dart';
import 'package:todo/domain/todo/models/todo_model.dart';
import 'package:todo/domain/todo/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  @override
  Future<void> setNewToDo(
      {required String name,
      required String time,
      required bool isToday}) async {
    if (isToday == true) {
      DatabaseService.instance.insertRaw(
          'INSERT INTO $tableToDoToday (${ToDoFields.name}, ${ToDoFields.time}, ${ToDoFields.isChecked}) VALUES("$name", "$time", 0)');
    } else {
      DatabaseService.instance.insertRaw(
          'INSERT INTO $tableToDoTomorrow (${ToDoFields.name}, ${ToDoFields.time}, ${ToDoFields.isChecked}) VALUES("$name", "$time", 0)');
    }
  }

  @override
  Future<List<ToDoModel>> getAllToDos({required bool isToday}) async {
    List<ToDoModel> todosListModel = [];

    List<Map> list = [];
    if (isToday == true) {
      list = await DatabaseService.instance
          .rawQuery('SELECT * FROM $tableToDoToday');
    } else {
      list = await DatabaseService.instance
          .rawQuery('SELECT * FROM $tableToDoTomorrow');
    }

    for (var i = 0; i < list.length; i++) {
      bool isChecked = false;

      if (list[i]["isChecked"] == 1) {
        isChecked = true;
      } else {
        isChecked = false;
      }

      todosListModel.add(ToDoModel(
          id: list[i]["id"],
          name: list[i]["name"],
          time: list[i]["time"],
          isChecked: isChecked));
    }

    todosListModel.sort((a, b) => a.time.compareTo(b.time));

    return todosListModel;
  }

  @override
  Future<void> checkToDo(
      {required int id, required bool isToday, required bool isCheked}) async {
    int isCheckedInt = 0;

    if (isCheked == true) {
      isCheckedInt = 0;
    } else {
      isCheckedInt = 1;
    }

    if (isToday == true) {
      await DatabaseService.instance.rawUpdate(
          'UPDATE $tableToDoToday SET isChecked = $isCheckedInt WHERE id = $id');
    } else {
      await DatabaseService.instance.rawUpdate(
          'UPDATE $tableToDoTomorrow SET isChecked = $isCheckedInt WHERE id = $id');
    }
  }

  @override
  Future<void> deleteToDo({required int id, required bool isToday}) async {
    if (isToday == true) {
      await DatabaseService.instance
          .rawDelete("DELETE FROM $tableToDoToday WHERE id = $id");
    } else {
      await DatabaseService.instance
          .rawDelete("DELETE FROM $tableToDoTomorrow WHERE id = $id");
    }
  }

  @override
  Future<void> deleteAll() async {
    await DatabaseService.instance.rawDelete("DELETE FROM $tableToDoTomorrow");
    await DatabaseService.instance.rawDelete("DELETE FROM $tableToDoToday");
  }
}
