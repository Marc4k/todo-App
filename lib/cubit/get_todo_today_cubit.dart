import 'package:bloc/bloc.dart';
import '../domain/todo/models/todo_model.dart';
import '../domain/todo/todo_repoisotory_impl.dart';

class GetToDoTodayCubit extends Cubit<List<ToDoModel>> {
  GetToDoTodayCubit() : super([]);

  Future<void> getToDo() async =>
      emit(await ToDoRepositoryImpl().getAllToDos(isToday: true));

  @override
  void onChange(Change<List<ToDoModel>> change) {
    super.onChange(change);
  }
}
