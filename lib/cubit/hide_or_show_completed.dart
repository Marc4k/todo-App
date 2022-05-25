import 'package:bloc/bloc.dart';
import 'package:todo/domain/todo/models/todo_model.dart';
import 'package:todo/domain/todo/todo_repoisotory_impl.dart';

class HideOrShowCompletedCubit extends Cubit<bool> {
  HideOrShowCompletedCubit() : super(false);

  void toggle(bool currentState) {
    bool newStateBool = !currentState;

    emit(newStateBool);
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
  }
}
