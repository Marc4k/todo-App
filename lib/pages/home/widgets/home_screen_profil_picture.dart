import 'package:flutter/material.dart';
import 'package:todo/shared/screen_adaption.dart';

class HomeScreenProfilPicture extends StatelessWidget {
  const HomeScreenProfilPicture({Key? key, required this.onClick})
      : super(key: key);

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    double radiusinPixel = 25;

    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onClick,
        child: CircleAvatar(
          radius: radiusinPixel * sW(context),
          foregroundImage: const NetworkImage(
              "https://images.unsplash.com/photo-1652904429112-432f2905f2a1?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765"),
        ),
      ),
    );
  }
}
