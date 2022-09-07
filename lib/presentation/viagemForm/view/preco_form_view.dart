import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../widget/custom_elevated_button.dart';
import 'viagem_criada_view.dart';

class PrecoFormView extends StatefulWidget {
  const PrecoFormView({Key? key}) : super(key: key);

  @override
  State<PrecoFormView> createState() => _PrecoFormViewState();
}

class _PrecoFormViewState extends State<PrecoFormView> {

  final _precoController = TextEditingController(text: "100,00");
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
                titulo: "Ser um Muvver",
                descricao: "Definir preço mínimo do deslocamento?",
                showCancelButton: true,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const TituloText(titulo: "Preço de entrega"),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        "Valor sugerido",
                        style: TextStyle(fontSize: 12, color: Color(0xFF808080)),
                      ),
                    ),
                    Slider(value: 0.5, onChanged: (value) {},),
                    Center(
                      child: IntrinsicWidth(
                        child: TextField(
                          controller: _precoController,
                          decoration: const InputDecoration(
                            prefix: Text("R\$ ")
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        "Clique no valor acima, para um preço mais específico.",
                        style: TextStyle(fontSize: 12, color: Color(0xFF737373)),
                      ),
                    ),

                  ],
                ),
              )),
            ],
          ),
          CustomElevatedButton(onPress: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ViagemCriadaView()));
          }),
        ],
      ),
    );
  }
}
