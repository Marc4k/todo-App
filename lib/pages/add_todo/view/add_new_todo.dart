import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
import 'package:todo/pages/add_todo/widgets/add_todo_text.dart';
import 'package:todo/pages/home/view/home_screen.dart';
import 'package:todo/shared/custom_text_widget.dart';
import 'package:todo/shared/screen_adaption.dart';

import '../../../domain/todo/models/todo_model.dart';
import '../../../domain/todo/todo_repoisotory_impl.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

TimeOfDay timeNow = TimeOfDay.now();
TextEditingController nameController = TextEditingController();
bool isToday = true;

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(29 * sH(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
                textSize: 40, fontWeight: FontWeight.bold, text: "Add a task"),
            const Spacer(),
            Row(
              children: [
                const AddToDoTextWidget(text: "Name"),
                SizedBox(width: 20 * sW(context)),
                Expanded(
                    child: TextFormField(
                  controller: nameController,
                ))
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const AddToDoTextWidget(text: "Hour"),
                Spacer(),
                CustomTextWidget(
                    textSize: 22,
                    fontWeight: FontWeight.w300,
                    text: timeNow.format(context)),
                IconButton(
                    onPressed: () async {
                      final TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: timeNow,
                      );
                      if (selectedTime != null) {
                        setState(() {
                          timeNow = selectedTime;
                        });
                      }
                    },
                    color: Colors.black,
                    iconSize: 20,
                    icon: const Icon(Icons.edit)),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const AddToDoTextWidget(text: "Today"),
                const Spacer(),
                Switch.adaptive(
                    value: isToday,
                    onChanged: (value) {
                      setState(() {
                        isToday = value;
                      });
                    })
              ],
            ),
            const Spacer(flex: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 45 * sH(context)),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                onPressed: () async {
                  if (nameController.text != null) {
                    await ToDoRepositoryImpl().setNewToDo(
                        name: nameController.text,
                        time: timeNow.format(context).toString(),
                        isToday: isToday);
                    nameController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text("Done")),
            const Spacer(flex: 2),
            Text(
              "If you disable today, the task will be considered as tomorrow",
              style: TextStyle(color: const Color(0xFF3C3C43).withOpacity(0.6)),
            ),
            const Spacer(flex: 80),
          ],
        ),
      ),
    );
  }
}
