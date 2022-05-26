import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/cubit/profil_picture_cubit.dart';
import 'package:todo/domain/todo/todo_repoisotory_impl.dart';
import 'package:todo/pages/user_screen/widget/user_screen_button.dart';

import '../../../shared/screen_adaption.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

File? fileImage;
bool imageSlected = false;
double radiusinPixel = 100;

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(29 * sH(context)),
            child: Column(
              children: [
                Spacer(),
                BlocBuilder<ProfilPictureCubit, String>(
                    builder: (context, imagePath) {
                  if (imagePath != "") {
                    imageSlected = true;
                  } else {
                    imageSlected = false;
                  }

                  return GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (pickedFile == null) return;

                      final imagePermanent =
                          await saveImagePermanently(pickedFile.path);

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('profilImg', imagePermanent.path);

                      context.read<ProfilPictureCubit>().getPicture();
                    },
                    child: CircleAvatar(
                      radius: radiusinPixel * sW(context),
                      backgroundImage: imageSlected
                          ? AssetImage(imagePath)
                          : AssetImage("assets/img/img.jpg"),
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                  );
                }),
                Spacer(flex: 50),
                UserScreenButton(
                  callback: () async {
                    await ToDoRepositoryImpl().deleteAll();

                    Navigator.pop(context);
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }
}

Future<File> saveImagePermanently(String imagePath) async {
  final directory = await getApplicationDocumentsDirectory();
  final name = basename(imagePath);
  final image = File("${directory.path}/$name");

  return File(imagePath).copy(image.path);
}
