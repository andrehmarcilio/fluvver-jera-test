import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_divider.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../../../domain/entity/peso.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_item_check_box.dart';
import 'preco_form_view.dart';

class PesoFormView extends StatefulWidget {
  const PesoFormView({Key? key}) : super(key: key);

  @override
  State<PesoFormView> createState() => _PesoFormViewState();
}

class _PesoFormViewState extends State<PesoFormView> {
  final List<Peso> pesos = Peso.values;
  String? pesoSelecionado;

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
                descricao: "Qual o peso do volume?",
                showCancelButton: true,
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
                        const TituloText(titulo: "Peso"),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: pesos.length,
                          itemBuilder: (context, position) {
                            final peso = pesos[position];
                            return CustomItemCheckBox(
                              imagePath: peso.imagePath,
                              value: peso.value,
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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PrecoFormView()));
          }),
        ],
      ),
    );
  }
}
