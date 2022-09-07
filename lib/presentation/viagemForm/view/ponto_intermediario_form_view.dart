import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_text_field.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../widget/custom_elevated_button.dart';

class PontoIntermediarioFormView extends StatelessWidget {
  PontoIntermediarioFormView({Key? key}) : super(key: key);
  final nomeCidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                showCloseButton: true,
              ),
              const SizedBox(
                height: 16,
              ),
              const TituloText(titulo: "Ponto intermediário"),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Insira os pontos intermediários na ',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.3,
                      color: Color(0xFF808080),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'sequência exata ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff222222),
                          )),
                      TextSpan(
                        text: 'em que você passará por eles',
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: nomeCidadeController,
                label: "Nome da cidade",
                icon: const Icon(Icons.search),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Usuários que viajam de campo Grande - MS para Dourados - MS também passam por:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700

                  ),
                ),
              )
            ],
          ),
          CustomElevatedButton(onPress: () {
            Navigator.of(context).pop();
          }, text: "Confirmar",),
        ],
      ),
    );
  }
}
