import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/home/widgets/todo_checked.dart';
import 'package:todo/pages/home/widgets/todo_not_check.dart';
import 'package:todo/shared/custom_text_widget.dart';
import 'package:todo/shared/screen_adaption.dart';

class HomeScreenTodayWidget extends StatelessWidget {
  const HomeScreenTodayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                  textSize: 34, fontWeight: FontWeight.bold, text: "Today"),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Hide completed",
                    style: TextStyle(fontSize: 13),
                  )),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ToDoNotChecked(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  time: "12:35",
                  onClick: () {});
            },
          )
        ],
      ),
    );
  }
}
