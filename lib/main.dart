import 'package:flutter/material.dart';
import 'cubit/get_todo_today_cubit.dart';
import 'cubit/get_todo_tomorrow_cubit.dart';
import 'cubit/hide_or_show_completed.dart';
import 'cubit/profil_picture_cubit.dart';
import 'pages/add_todo/view/add_new_todo.dart';
import 'pages/home/view/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
    ], child: const HomeScreen());
  }
}
