import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;

  // width and height initialization
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData!.size.height;
    screenWidth = mediaQueryData!.size.width;
  }

  // spacing height
  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  static const spaceSmall = SizedBox(
    height: 25,
  );

  static final spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );

  static final spaceLarge = SizedBox(
    height: screenHeight! * 0.08,
  );

  // textformfield border

  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.greenAccent,
    ),
  );

  static const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );

  static const primaryColor = Color(0xFF4CAF50);

  static const String baseUrl =
      "http://127.0.0.1:8000"; // Change this when deploying
}
