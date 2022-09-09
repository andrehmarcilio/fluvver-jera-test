import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_divider.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../../../domain/entity/peso.dart';
import '../../../domain/entity/viagem.dart';
import '../../../domain/entity/volume.dart';
import '../../../utils/toast/advice_toast.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_item_check_box.dart';

class PesoFormView extends StatefulWidget {
  const PesoFormView({Key? key, this.popFormFlow}) : super(key: key);
  final VoidCallback? popFormFlow;
  @override
  State<PesoFormView> createState() => _PesoFormViewState();
}

class _PesoFormViewState extends State<PesoFormView> {
  final List<Peso> pesos = Peso.values;
  Peso? pesoSelecionado;

  void _atualizarFluxoFormulario(Peso peso) {
    context.flow<Viagem>().update((viagem) =>
        viagem.copyWith(
            volume: viagem.volume?.copyWith(peso: peso) ??
                Volume(peso: peso)));
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
                descricao: "Qual o peso do volume?",
                showCancelButton: true,
                popFormFlow: widget.popFormFlow,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    minimum: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        const TituloText(titulo: "Peso"),
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: pesos.length,
                          itemBuilder: (context, position) {
                            final peso = pesos[position];
                            return CustomItemCheckBox(
                              imagePath: peso.imagePath,
                              value: peso,
                              selectedValue: pesoSelecionado,
                              name: peso.nome,
                              onChanged: (valor) {
                                setState(() {
                                  pesoSelecionado = valor;
                                });
                              },
                            );
                          },
                          separatorBuilder: (context, position) {
                            return const CustomDivider();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomElevatedButton(onPress: () {
            if(pesoSelecionado != null) {
              _atualizarFluxoFormulario(pesoSelecionado!);
            } else {
              AdviceToast.show(
                  context, "Selecione algum item para continuar");
            }
          }),
        ],
      ),
    );
  }
}
