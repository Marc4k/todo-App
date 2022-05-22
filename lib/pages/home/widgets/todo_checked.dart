import 'package:flutter/material.dart';

class ToDoChecked extends StatelessWidget {
  const ToDoChecked(
      {Key? key, required this.text, required this.time, required this.onClick})
      : super(key: key);

  final String text;
  final String time;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          value: true,
          onChanged: (bool? value) => onClick,
        ),
        Column(
          children: [
            Text(
              text,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        )
      ],
    );
  }
}
