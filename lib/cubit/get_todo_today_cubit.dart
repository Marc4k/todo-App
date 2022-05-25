import 'package:bloc/bloc.dart';
import 'package:todo/domain/todo/models/todo_model.dart';
import 'package:todo/domain/todo/todo_repoisotory_impl.dart';

class GetToDoCubit extends Cubit<List<ToDoModel>> {
  GetToDoCubit() : super([]);

  Future<void> getToDoToday() async =>
      emit(await ToDoRepositoryImpl().getAllToDosToday());

  @override
  void onChange(Change<List<ToDoModel>> change) {
    super.onChange(change);
  }
}
