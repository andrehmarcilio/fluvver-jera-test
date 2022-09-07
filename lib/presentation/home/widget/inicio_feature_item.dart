import 'package:flutter/material.dart';

import '../../theme.dart';

class InicioFeatureItem extends StatelessWidget {
  const InicioFeatureItem(
      {Key? key,
      required this.onPressed,
      required this.featureImage,
      required this.titulo,
      required this.descricao})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget featureImage;
  final String titulo;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient:  linearGradiente,
          boxShadow: const [shadow],
          borderRadius: BorderRadius.circular(3.5)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 129.0,
        ),
        child: InkWell(
          onTap: () => onPressed(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          titulo,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        descricao,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 0,
                            height: 1.3),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                  child: Center(child: featureImage),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
