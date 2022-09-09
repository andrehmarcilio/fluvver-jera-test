import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/viagem.dart';
import '../bloc/viagens_cubit.dart';
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
    return Scaffold(
      body: const HomeInicioView(),
      bottomNavigationBar: const HomeBottomNavigationBar(),
      floatingActionButton:
          BlocBuilder<ViagensCubit, List<Viagem>>(builder: (context, state) {
        if (state.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return FloatingActionButton(
            onPressed: () => Navigator.of(context).pushNamed("/viagem-list"),
            child: const Icon(Icons.map),
          );
        }
      }),
    );
  }
}
