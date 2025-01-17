import 'package:flutter/material.dart';

final ThemeData wadizDefaultTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Pretendard",
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  ),
  primaryColor: AppColors.primaryColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    surfaceTintColor: Colors.white,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(
          color: AppColors.wadizGray[200]!,
        ),
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 16.0),
        minimumSize: Size(64, 50)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xffd4d4d4),
        width: 1.0,
      ),
    ),
    outlineBorder: BorderSide(
      color: AppColors.primaryColor,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 1.0,
      ),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 1.0,
      ),
    ),

    hintStyle: TextStyle(
      fontSize: 16,
      color: AppColors.wadizGray[400],
      fontWeight: FontWeight.w500,
    ),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);

class AppColors extends Color {
  AppColors(super.value);

  static const Color scaffoldBackgroundColor = Color(0xfff2f4f6);
  static const Color primaryColor = Color(0xff03c3c4);
  static const Color secondary = Color(0xff32f9f9);
  static const Color bg = Color(0xfff2f2f7);
  static const Color newBg = Color(0xfff2f4f6);

  static const Color white = Colors.white;
  static const int _grayPrimaryValue = 0xff848487;

  static const MaterialColor wadizGray =
      MaterialColor(_grayPrimaryValue, <int, Color>{
    50: Color(0xffffebee),
    100: Color(0xffe5e5ea),
    200: Color(0xffd4d4d4),
    300: Color(0xffaeaeb2),
    400: Color(0xff8e8e93),
    500: Color(_grayPrimaryValue),
    600: Color(0xff646464),
    700: Color(0xff4a4a4a),
    800: Color(0xff303030),
    900: Color(0xff242424),
  });
}
