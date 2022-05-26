import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/profil_picture_cubit.dart';
import '../../../shared/screen_adaption.dart';

class HomeScreenProfilPicture extends StatelessWidget {
  const HomeScreenProfilPicture({Key? key, required this.onClick})
      : super(key: key);

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    double radiusinPixel = 25;

    return BlocBuilder<ProfilPictureCubit, String>(
      builder: (context, imagePath) {
        if (imagePath != "") {
          File img = File(imagePath);
          return Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onClick,
              child: CircleAvatar(
                  radius: radiusinPixel * sW(context),
                  foregroundImage: FileImage(img)),
            ),
          );
        } else {
          return Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onClick,
              child: CircleAvatar(
                  radius: radiusinPixel * sW(context),
                  foregroundImage: const AssetImage("assets/img/img.jpg")),
            ),
          );
        }
      },
    );
  }
}
