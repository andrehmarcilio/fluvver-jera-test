import 'package:flutter/material.dart';

class PontoIntermediarioItem extends StatelessWidget {
  const PontoIntermediarioItem({Key? key, required this.nome, this.onPressed}) : super(key: key);
  final String nome;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 16,
            ),
            Image.asset(
              "assets/images/point-map.png",
              height: 22.24,
              width: 14.83,
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: width - 130,
              child: Text(
                nome,
                maxLines: 1,
                style: const TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
        Padding(padding: const EdgeInsets.only(right: 16),
        child: IconButton(icon: const Icon(Icons.close), onPressed: onPressed,),)
      ],
    );
  }
}
