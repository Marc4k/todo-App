import 'package:flutter/material.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
import 'package:todo/cubit/get_todo_tomorrow_cubit.dart';
import 'package:todo/cubit/hide_or_show_completed.dart';
import 'package:todo/cubit/profil_picture_cubit.dart';
import 'package:todo/pages/add_todo/view/add_new_todo.dart';
import 'package:todo/pages/home/view/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GetToDoTodayCubit>(
          create: (BuildContext context) => GetToDoTodayCubit()..getToDo()),
      BlocProvider<GetToDoTomorrowCubit>(
          create: (BuildContext context) => GetToDoTomorrowCubit()..getToDo()),
      BlocProvider<ProfilPictureCubit>(
          create: (BuildContext context) => ProfilPictureCubit()..getPicture()),
      BlocProvider<HideOrShowCompletedCubit>(
          create: (BuildContext context) =>
              HideOrShowCompletedCubit()..toggle(false)),
      //GetEasySelectDataCubit
    ], child: HomeScreen());
  }
}
