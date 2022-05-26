import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPictureCubit extends Cubit<String> {
  ProfilPictureCubit() : super("");

  Future<void> getPicture() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('profilImg');

    if (data != null) {
      emit(data);
    } else {
      emit("");
    }
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
  }
}
