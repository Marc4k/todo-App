import 'package:sqflite/sqflite.dart';
import 'package:todo/domain/todo/models/todo_model.dart';
import 'package:todo/domain/todo/todo_repository.dart';
import 'package:path/path.dart';
import 'package:collection/collection.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  static final ToDoRepositoryImpl instance = ToDoRepositoryImpl._init();
  static Database? _database;

  ToDoRepositoryImpl._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  @override
  Future<void> setNewToDo(String name, String time, bool isToday) async {
    final db = await instance.database;
    int id = await db.rawInsert(
        'INSERT INTO todo (${ToDoFields.name}, ${ToDoFields.time}, ${ToDoFields.isChecked}) VALUES("$name", "$time", 0)');
  }

  @override
  Future<List<ToDoModel>> getAllToDosToday() async {
    List<ToDoModel> todosToday = [];

    final db = await instance.database;
    List<Map> list = await db.rawQuery('SELECT * FROM $tableToDo');

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
}

Future _createDB(Database db, int version) async {
  await db.execute(
      'CREATE TABLE $tableToDo (id INTEGER PRIMARY KEY, ${ToDoFields.name} TEXT, ${ToDoFields.time} TEXT, ${ToDoFields.isChecked} BOOLEAN)');
}
