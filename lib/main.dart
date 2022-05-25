import 'package:flutter/material.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
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
      routes: {
        "/newToDo": (context) => AddNewTodoScreen(),
      },
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
      BlocProvider<GetToDoCubit>(
          create: (BuildContext context) => GetToDoCubit()..getToDoToday()),

      //GetEasySelectDataCubit
    ], child: HomeScreen());
  }
}
