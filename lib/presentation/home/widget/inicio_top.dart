import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InicioTop extends StatelessWidget {
  const InicioTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
        "assets/images/logo.svg",
        color: const Color(0xFF222222),
        semanticsLabel: 'Logo da muvver',
          width: 80,
          height: 15,
    ),
        Container(width: 32, height: 32, color: Colors.red,
        child: Image.asset("assets/images/fotoperfil.jpeg", fit: BoxFit.cover,),)
      ],
    ),);
  }
}
