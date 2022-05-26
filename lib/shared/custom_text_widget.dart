import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen_adaption.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {Key? key,
      required this.textSize,
      required this.fontWeight,
      required this.text})
      : super(key: key);

  final double textSize;
  final FontWeight fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.black;
    const double letterSpacing = 0;
    return Text(
      text,
      textAlign: TextAlign.center,
      textScaleFactor: textscale(context),
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: textColor,
      )),
    );
  }
}
