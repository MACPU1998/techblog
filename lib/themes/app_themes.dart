import 'package:flutter/material.dart';
import 'package:techblog/component/myColors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return const TextStyle(
              fontSize: 16,
              fontFamily: 'dana',
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle,
            );
          }
          return const TextStyle(
            fontSize: 15,
            fontFamily: 'dana',
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          );
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return SolidColors.seeMore;
          }
          return SolidColors.primaryColor;
        }),
      ),
    ),
    fontFamily: 'dana',
    brightness: Brightness.light,
    hintColor: SolidColors.primaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.posterTitle),
      titleMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: SolidColors.posterSubTitle),
      bodyLarge: TextStyle(
          fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
      displayMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w300),
      displaySmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: SolidColors.seeMore,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Color.fromARGB(255, 70, 70, 70),
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: SolidColors.hintText,
          fontWeight: FontWeight.w700),
    ),
  );
}