import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
import 'package:todo/pages/home/widgets/todo_list_item.dart';
import 'package:todo/shared/custom_text_widget.dart';

import '../../../domain/todo/models/todo_model.dart';

class HomeScreenTodayWidget extends StatefulWidget {
  const HomeScreenTodayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenTodayWidget> createState() => _HomeScreenTodayWidgetState();
}

String showAll = "Show completed";
String hide = "Hide completed";
bool showCompleted = true;

class _HomeScreenTodayWidgetState extends State<HomeScreenTodayWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
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
                    style: TextStyle(fontSize: 13),
                  )),
            ],
          ),
          BlocBuilder<GetToDoCubit, List<ToDoModel>>(
            builder: (context, todo) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  if (showCompleted == true) {
                    return ToDoListItem(
                      isChecked: todo[index].isChecked,
                      text: todo[index].name,
                      time: todo[index].time,
                      id: todo[index].id,
                    );
                  } else {
                    if (todo[index].isChecked == false) {
                      return ToDoListItem(
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
              );
            },
          )
        ],
      ),
    );
  }
}
