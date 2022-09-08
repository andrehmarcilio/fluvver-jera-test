import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/view/trajeto_form_view.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_divider.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../../../domain/entity/veiculo.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_item_check_box.dart';

class VeiculoFormView extends StatefulWidget {
  const VeiculoFormView({Key? key}) : super(key: key);

  @override
  State<VeiculoFormView> createState() => _VeiculoFormViewState();
}

class _VeiculoFormViewState extends State<VeiculoFormView> {
  final List<Veiculo> veiculos = Veiculo.values;
  String? veiculoSelecionado;

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
                titulo: "Viajante",
                descricao: "Qual será o meio de transporte da sua viagem?",
                showCloseButton: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    minimum: const EdgeInsets.only(bottom: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        const TituloText(titulo: "Transporte"),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: veiculos.length,
                          itemBuilder: (context, position) {
                            final veiculo = veiculos[position];
                            return CustomItemCheckBox(
                              imagePath: veiculo.imagePath,
                              value: veiculo.value,
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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TrajetoContainer()));
          }),
        ],
      ),
    );
  }
}
