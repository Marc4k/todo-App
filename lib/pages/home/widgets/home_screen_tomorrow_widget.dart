import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todo_list_item.dart';

import '../../../cubit/get_todo_tomorrow_cubit.dart';
import '../../../domain/todo/models/todo_model.dart';
import '../../../domain/todo/todo_repoisotory_impl.dart';
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
          children: const [
            CustomTextWidget(
                textSize: 34, fontWeight: FontWeight.bold, text: "Tomorrow"),
            Spacer(),
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
                    return Dismissible(
                      onDismissed: ((direction) {
                        ToDoRepositoryImpl()
                            .deleteToDo(id: todo[index].id, isToday: false);

                        context.read<GetToDoTomorrowCubit>().getToDo();
                      }),
                      key: Key(todo[index].id.toString()),
                      child: ToDoListItem(
                        isToday: false,
                        isChecked: todo[index].isChecked,
                        text: todo[index].name,
                        time: todo[index].time,
                        id: todo[index].id,
                      ),
                    );
                  } else {
                    if (todo[index].isChecked == false) {
                      return Dismissible(
                        onDismissed: ((direction) {
                          ToDoRepositoryImpl()
                              .deleteToDo(id: todo[index].id, isToday: false);

                          context.read<GetToDoTomorrowCubit>().getToDo();
                        }),
                        key: Key(todo[index].id.toString()),
                        child: ToDoListItem(
                          isToday: false,
                          isChecked: todo[index].isChecked,
                          text: todo[index].name,
                          time: todo[index].time,
                          id: todo[index].id,
                        ),
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
