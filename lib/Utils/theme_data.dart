import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

class MyAppThemeData {
  static final themeData = ThemeData(
    // fontFamily: MyWrittenText.poppins,
    primaryColor: MyColor.turcoiseColor,
    errorColor: MyColor.turcoiseColor,
    primarySwatch: MyColor.customPrimarySwatch,
    scaffoldBackgroundColor: MyColor.scaffoldColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColor.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: MyColor.turcoiseColor,
      ),
    ),
  );

  static final darkThemeData = ThemeData.dark(
    useMaterial3: true,
    // fontFamily: MyWrittenText.poppins,
    // backgroundColor: MyColor.blackColor,
    // cardColor: MyColor.whiteColor,
    // primaryColor: MyColor.turcoiseColor,
    // errorColor: MyColor.turcoiseColor,
    // primarySwatch: MyColor.customPrimarySwatch,
    // scaffoldBackgroundColor: MyColor.scaffoldColor,
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: MyColor.whiteColor,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarColor: MyColor.turcoiseColor,
    //   ),
    // ),
  );
}
