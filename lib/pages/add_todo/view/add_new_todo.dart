import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:todo/cubit/get_todo_today_cubit.dart';
import 'package:todo/pages/add_todo/widgets/add_todo_button.dart';
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
DateTime time = DateTime.now();
TextEditingController nameController = TextEditingController();
bool isToday = true;

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                textSize: 35, fontWeight: FontWeight.bold, text: "Add a task"),
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
                      if (Platform.isAndroid) {
                        final TimeOfDay? selectedTime = await showTimePicker(
                          context: context,
                          initialTime: timeNow,
                        );

                        if (selectedTime != null) {
                          setState(() {
                            timeNow = selectedTime;
                          });
                        }
                      } else if (Platform.isIOS) {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext builder) {
                              return Container(
                                height: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .height *
                                    0.25,
                                color: Colors.white,
                                child: CupertinoDatePicker(
                                  initialDateTime: time,
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  // This is called when the user changes the time.
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() {
                                      time = newTime;
                                      timeNow = TimeOfDay.fromDateTime(time);
                                    });
                                  },
                                ),
                              );
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
            AddToDoButton(
              callback: () async {
                if (nameController.text != null) {
                  await ToDoRepositoryImpl().setNewToDo(
                      name: nameController.text,
                      time: timeNow.format(context).toString(),
                      isToday: isToday);
                  nameController.clear();
                  Navigator.pop(context);
                }
              },
            ),
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
