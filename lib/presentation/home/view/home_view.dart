import 'package:flutter/material.dart';

import '../widget/home_bottom_navigation_bar.dart';
import 'home_inicio_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeInicioView(),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}
