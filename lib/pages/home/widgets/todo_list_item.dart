import 'package:flutter/material.dart';
import 'package:todo/domain/todo/todo_repoisotory_impl.dart';
import 'package:todo/shared/screen_adaption.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/get_todo_today_cubit.dart';

class ToDoListItem extends StatefulWidget {
  const ToDoListItem({
    Key? key,
    required this.text,
    required this.time,
    required this.isChecked,
    required this.id,
  }) : super(key: key);

  final int id;
  final bool isChecked;
  final String text;
  final String time;

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            value: widget.isChecked,
            onChanged: (value) async {
              await ToDoRepositoryImpl().checkToDo(id: widget.id);
              context.read<GetToDoCubit>().getToDoToday();
            }),
        Expanded(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text,
                  textScaleFactor: textscale(context),
                  style: TextStyle(
                    decoration: widget.isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF737373),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.time,
                  textScaleFactor: textscale(context),
                  style: TextStyle(
                    decoration: widget.isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA3A3A3),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
