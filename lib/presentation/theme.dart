import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff24B96E),
      primary: const Color(0xff222222),
      secondary: const Color(0xff24B96E)),
  fontFamily: "TitilliumWeb",
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(backgroundColor: Color(0xff222222)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color(0xff16A45C),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(color: Colors.white),
      ),
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
    unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(255, 255, 255, 0.54)),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  )

);

const linearGradiente = LinearGradient(
  begin: Alignment.centerLeft,
  colors: <Color>[
    Color(0xFF232423),
    Color(0xff242326),
  ],
  tileMode: TileMode.clamp,
);

const shadow =
    BoxShadow(offset: Offset(0, 3), color: Color(0x22222229), blurRadius: 6.0);
