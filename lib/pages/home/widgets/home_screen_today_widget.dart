import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
import 'package:todo/cubit/hide_or_show_completed.dart';
import 'package:todo/pages/home/widgets/todo_list_item.dart';
import 'package:todo/shared/custom_text_widget.dart';
import 'package:todo/shared/screen_adaption.dart';

import '../../../domain/todo/models/todo_model.dart';

class HomeScreenTodayWidget extends StatefulWidget {
  const HomeScreenTodayWidget({
    required this.showCompleted,
    Key? key,
  }) : super(key: key);
  final bool showCompleted;
  @override
  State<HomeScreenTodayWidget> createState() => _HomeScreenTodayWidgetState();
}

String showAll = "Show completed";
String hide = "Hide completed";

class _HomeScreenTodayWidgetState extends State<HomeScreenTodayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetToDoTodayCubit, List<ToDoModel>>(
          builder: (context, todo) {
            return SizedBox(
              height: getHeight(context) / 2.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  if (widget.showCompleted == true) {
                    return ToDoListItem(
                      isToday: true,
                      isChecked: todo[index].isChecked,
                      text: todo[index].name,
                      time: todo[index].time,
                      id: todo[index].id,
                    );
                  } else {
                    if (todo[index].isChecked == false) {
                      return ToDoListItem(
                        isToday: true,
                        isChecked: todo[index].isChecked,
                        text: todo[index].name,
                        time: todo[index].time,
                        id: todo[index].id,
                      );
                    } else {
                      return Container();
                    }
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}