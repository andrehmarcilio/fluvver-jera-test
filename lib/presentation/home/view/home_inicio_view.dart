import 'package:flutter/material.dart';

import '../widget/inicio_body.dart';
import '../widget/inicio_app_bar.dart';

class HomeInicioView extends StatelessWidget {
  const HomeInicioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        minimum: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: const [
            SizedBox(height: 10),
            InicioAppBar(),
            SizedBox(height: 56),
            InicioBody()
          ],
        ),
      ),
    );
  }
}
