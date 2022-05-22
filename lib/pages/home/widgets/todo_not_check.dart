import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo/shared/screen_adaption.dart';

class ToDoNotChecked extends StatelessWidget {
  const ToDoNotChecked(
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          value: false,
          onChanged: (bool? value) => onClick,
        ),
        Column(
          children: [
            Text(
              text,
              textScaleFactor: textscale(context),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF737373),
              ),
            ),
            Text(
              time,
              textScaleFactor: textscale(context),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFFA3A3A3),
              ),
            ),
          ],
        )
      ],
    );
  }
}
