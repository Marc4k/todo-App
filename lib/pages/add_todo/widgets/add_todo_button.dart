import 'package:flutter/material.dart';

import '../../../shared/screen_adaption.dart';

class AddToDoButton extends StatelessWidget {
  const AddToDoButton({Key? key, required this.callback}) : super(key: key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(double.maxFinite, 45 * sH(context)),
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
        onPressed: callback,
        child: const Text("Done"));
  }
}
