import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_divider.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';
import 'package:muvver_jera_teste/utils/toast/advice_toast.dart';

import '../../../domain/entity/veiculo.dart';
import '../../../domain/entity/viagem.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_item_check_box.dart';

class VeiculoFormView extends StatefulWidget {
  const VeiculoFormView({Key? key, required this.popFormFlow})
      : super(key: key);
  final VoidCallback popFormFlow;

  @override
  State<VeiculoFormView> createState() => _VeiculoFormViewState();
}

class _VeiculoFormViewState extends State<VeiculoFormView> {
  final List<Veiculo> veiculos = Veiculo.values;
  Veiculo? veiculoSelecionado;

  void atualizarFluxoFormulario() {
    context
        .flow<Viagem>()
        .update((viagem) => viagem.copyWith(veiculo: veiculoSelecionado));
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
                titulo: "Viajante",
                descricao: "Qual será o meio de transporte da sua viagem?",
                showCloseButton: true,
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
                        const TituloText(titulo: "Transporte"),
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: veiculos.length,
                          itemBuilder: (context, position) {
                            final veiculo = veiculos[position];
                            return CustomItemCheckBox(
                              imagePath: veiculo.imagePath,
                              value: veiculo,
                              selectedValue: veiculoSelecionado,
                              name: veiculo.nome,
                              onChanged: (valor) {
                                setState(() {
                                  veiculoSelecionado = valor;
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
            if (veiculoSelecionado != null) {
              atualizarFluxoFormulario();
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
