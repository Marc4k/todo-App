import 'package:flutter/material.dart';

import '../constants/screen_adaption_config.dart';

double sW(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final sW = width / mockUpWidth;
  return sW;
}

double sH(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final sH = height / mockUpHeight;
  return sH;
}

double textscale(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  final textscaleWidth = width / mockUpWidth;
  final textscaleHeight = width / mockUpHeight;

  final textscale = (textscaleWidth + textscaleHeight) / 2;
  return textscale;
}

double getHeight(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return height;
}

double getWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width;
}
