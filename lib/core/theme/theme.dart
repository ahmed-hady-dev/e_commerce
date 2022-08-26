import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    brightness: Brightness.light,
    dividerColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.black),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline1: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
          headline2: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          headline3: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          headline4: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          headline5: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          headline6: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          bodyText1: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            height: 1.75,
            fontSize: 12,
          ),
          bodyText2: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 10,
          ),
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.cyan,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(18),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(18),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(18),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.grey,
    ),
  );
}

//===============================================================
ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    textTheme: ThemeData.dark().textTheme.apply(),
    primaryTextTheme: ThemeData.dark().textTheme.apply(),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.grey,
      filled: true,
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
      focusedBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
      enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
    ),
    brightness: Brightness.dark,
    dividerColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
