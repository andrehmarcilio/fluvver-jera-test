import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      this.titulo,
      this.descricao,
      this.showCancelButton = false,
      this.showCloseButton = false,
      this.tabBar})
      : super(key: key);

  final String? titulo;
  final String? descricao;
  final bool showCloseButton;
  final bool showCancelButton;
  final Widget? tabBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          const BoxDecoration(gradient: linearGradiente, boxShadow: [shadow]),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 70,
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: showCloseButton
                          ? Image.asset(
                              "assets/icons/ic_close.png",
                            )
                          : Image.asset("assets/icons/ic_back.png"),
                    ),
                  ),
                  Text(
                    titulo ?? "",
                    style:
                        const TextStyle(color: Color(0x8affffff), fontSize: 16),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 70,
                    child: showCancelButton
                        ? InkWell(
                            onTap: () {},
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ))
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
            descricao != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          descricao ?? "",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 0),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            tabBar ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
