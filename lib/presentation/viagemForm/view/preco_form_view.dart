import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../../../domain/entity/viagem.dart';
import '../widget/custom_elevated_button.dart';

class PrecoFormView extends StatefulWidget {
  const PrecoFormView({Key? key, this.popFormFlow}) : super(key: key);
  final VoidCallback? popFormFlow;
  @override
  State<PrecoFormView> createState() => _PrecoFormViewState();
}

class _PrecoFormViewState extends State<PrecoFormView> {
  double value = 100.0;

  final _precoController = TextEditingController(text: "100.00");

  void _atualizarFluxoFormulario(double preco) {
    context.flow<Viagem>().complete((viagem) =>
        viagem.copyWith(
            preco:preco));
  }

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
              CustomAppBar(
                titulo: "Ser um Muvver",
                descricao: "Definir preço mínimo do deslocamento?",
                showCancelButton: true,
                popFormFlow: widget.popFormFlow,
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
                    Slider(
                      max: 700,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                          _precoController.text = value.toStringAsFixed(2);
                        });
                      },
                    ),
                    Center(
                      child: IntrinsicWidth(
                        child: TextField(
                          controller: _precoController,
                          onChanged: (value) {
                            final newValue = double.parse(value);
                            if (newValue > 1000) {
                              setState(() {
                                _precoController.text = "1000.00";
                                this.value = 1000;
                              });
                            } else  if (newValue < 0) {
                              setState(() {
                                _precoController.text = "0";
                                this.value = 0;
                              });
                            } else {
                              setState(() {
                                this.value = newValue;
                              });
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              prefix: Text("R\$ "),
                              border: UnderlineInputBorder()),
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
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF737373)),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
          CustomElevatedButton(onPress: () {
            _atualizarFluxoFormulario(value);
          }),
        ],
      ),
    );
  }
}
