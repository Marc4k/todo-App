import 'package:flutter/material.dart';
import 'package:todo/pages/home/widgets/home_scree_today_widget.dart';
import 'package:todo/pages/home/widgets/home_screen_profil_picture.dart';
import 'package:todo/shared/screen_adaption.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              18 * sW(context), 18 * sW(context), 18 * sW(context), 0),
          child: Column(
            children: [
              HomeScreenProfilPicture(),
              HomeScreenTodayWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
