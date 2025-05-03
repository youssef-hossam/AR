import 'package:flutter/material.dart';

class AssetsData {
  static const String logo = 'assets/images/logo.png';
  static const String home = 'assets/images/home.png';
}

BoxDecoration backGroundDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
    colors: [Color(0xff865BFF), Color(0xff60C8E5)],
  ));
}
