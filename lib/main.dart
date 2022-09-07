import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/home/view/home_view.dart';
import 'presentation/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _mudarCorDaStatusBar();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muvver',
      theme: theme,
      home: const HomeView(),
    );
  }
}

void _mudarCorDaStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
}