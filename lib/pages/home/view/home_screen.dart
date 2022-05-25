// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
import 'package:todo/pages/add_todo/view/add_new_todo.dart';
import 'package:todo/pages/home/widgets/home_screen_today_widget.dart';
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
              HomeScreenProfilPicture(),
              HomeScreenTodayWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewTodoScreen()),
          );
          context.read<GetToDoCubit>().getToDoToday();
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
