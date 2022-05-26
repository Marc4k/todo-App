import 'package:bloc/bloc.dart';
import '../domain/todo/models/todo_model.dart';
import '../domain/todo/todo_repoisotory_impl.dart';

class GetToDoTomorrowCubit extends Cubit<List<ToDoModel>> {
  GetToDoTomorrowCubit() : super([]);

  Future<void> getToDo() async =>
      emit(await ToDoRepositoryImpl().getAllToDos(isToday: false));

  @override
  void onChange(Change<List<ToDoModel>> change) {
    super.onChange(change);
  }
}
