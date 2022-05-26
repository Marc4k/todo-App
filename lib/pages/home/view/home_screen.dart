// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
import 'package:todo/cubit/get_todo_tomorrow_cubit.dart';
import 'package:todo/cubit/profil_picture_cubit.dart';
import 'package:todo/pages/add_todo/view/add_new_todo.dart';
import 'package:todo/pages/home/widgets/home_screen_today_widget.dart';
import 'package:todo/pages/home/widgets/home_screen_profil_picture.dart';
import 'package:todo/pages/home/widgets/home_screen_tomorrow_widget.dart';
import 'package:todo/pages/user_screen/view/user_screen.dart';
import 'package:todo/shared/screen_adaption.dart';

import '../../../shared/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool showCompleted = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              18 * sW(context), 5 * sW(context), 18 * sW(context), 0),
          child: Column(
            children: [
              const Spacer(),
              HomeScreenProfilPicture(
                onClick: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider<ProfilPictureCubit>(
                                  create: (context) =>
                                      ProfilPictureCubit()..getPicture()),
                            ],
                            child: const UserScreen(),
                          )));

                  context.read<GetToDoTodayCubit>().getToDo();
                  context.read<GetToDoTomorrowCubit>().getToDo();
                  context.read<ProfilPictureCubit>().getPicture();
                },
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextWidget(
                      textSize: 34, fontWeight: FontWeight.bold, text: "Today"),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          showCompleted = !showCompleted;
                        });
                      },
                      child: Text(
                        showCompleted ? hide : showAll,
                        style: const TextStyle(fontSize: 13),
                      )),
                ],
              ),
              HomeScreenTodayWidget(showCompleted: showCompleted),
              HomeScreenTomorrowWidget(showCompleted: showCompleted),
              const Spacer()
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
          context.read<GetToDoTodayCubit>().getToDo();
          context.read<GetToDoTomorrowCubit>().getToDo();
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
