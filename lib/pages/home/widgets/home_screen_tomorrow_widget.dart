import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/pages/home/widgets/todo_list_item.dart';

import '../../../cubit/get_todo_today_cubit.dart';
import '../../../cubit/get_todo_tomorrow_cubit.dart';
import '../../../domain/todo/models/todo_model.dart';
import '../../../shared/custom_text_widget.dart';
import '../../../shared/screen_adaption.dart';

class HomeScreenTomorrowWidget extends StatefulWidget {
  const HomeScreenTomorrowWidget({Key? key, required this.showCompleted})
      : super(key: key);
  final bool showCompleted;
  @override
  State<HomeScreenTomorrowWidget> createState() =>
      _HomeScreenTomorrowWidgetState();
}

class _HomeScreenTomorrowWidgetState extends State<HomeScreenTomorrowWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
                textSize: 34, fontWeight: FontWeight.bold, text: "Tomorrow"),
            const Spacer(),
          ],
        ),
        BlocBuilder<GetToDoTomorrowCubit, List<ToDoModel>>(
          builder: (context, todo) {
            return SizedBox(
              height: getHeight(context) / 3.1,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  if (widget.showCompleted == true) {
                    return ToDoListItem(
                      isToday: false,
                      isChecked: todo[index].isChecked,
                      text: todo[index].name,
                      time: todo[index].time,
                      id: todo[index].id,
                    );
                  } else {
                    if (todo[index].isChecked == false) {
                      return ToDoListItem(
                        isToday: false,
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
        )
      ],
    );
  }
}
