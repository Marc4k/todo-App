import 'package:flutter/material.dart';
import 'package:todo/domain/todo/models/todo_model.dart';
import 'package:todo/domain/todo/todo_repoisotory_impl.dart';
import 'package:todo/pages/add_todo/view/add_new_todo.dart';
import 'package:todo/pages/home/widgets/home_scree_today_widget.dart';
import 'package:todo/pages/home/widgets/home_screen_profil_picture.dart';
import 'package:todo/shared/screen_adaption.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              18 * sW(context), 18 * sW(context), 18 * sW(context), 0),
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Safe")),
              ElevatedButton(
                  onPressed: () async {
                    List<ToDoModel> data =
                        await ToDoRepositoryImpl.instance.getAllToDosToday();
                  },
                  child: Text("Show")),
              HomeScreenProfilPicture(),
              HomeScreenTodayWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewTodoScreen()),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
