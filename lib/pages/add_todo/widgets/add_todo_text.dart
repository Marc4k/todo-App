import 'package:flutter/material.dart';

import '../../../shared/custom_text_widget.dart';

class AddToDoTextWidget extends StatelessWidget {
  const AddToDoTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomTextWidget(
        textSize: 25, fontWeight: FontWeight.w500, text: text);
  }
}
