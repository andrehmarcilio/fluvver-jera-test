import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_divider.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../../../domain/entity/tamanho.dart';
import '../../../domain/entity/viagem.dart';
import '../../../domain/entity/volume.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_item_check_box.dart';

class TamanhoFormView extends StatefulWidget {
  const TamanhoFormView({Key? key}) : super(key: key);

  @override
  State<TamanhoFormView> createState() => _TamanhoFormViewState();
}

class _TamanhoFormViewState extends State<TamanhoFormView> {
  final List<Tamanho> tamanhos = Tamanho.values;
  Tamanho? tamanhoSelecionado;

  void _atualizarFluxoFormulario(Tamanho tamanho) {
    context.flow<Viagem>().update((viagem) => viagem.copyWith(
        volume: viagem.volume?.copyWith(tamanho: tamanho) ??
            Volume(tamanho: tamanho)));
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
              const CustomAppBar(
                titulo: "Ser um Muvver",
                descricao:
                    "O volume que você pode deslocar tem tamanho similar a que?",
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
                        const TituloText(titulo: "Tamanhos"),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: tamanhos.length,
                          itemBuilder: (context, position) {
                            final tamanho = tamanhos[position];
                            return CustomItemCheckBox(
                              imagePath: tamanho.imagePath,
                              value: tamanho,
                              selectedValue: tamanhoSelecionado,
                              name: tamanho.nome,
                              onChanged: (valor) {
                                setState(() {
                                  tamanhoSelecionado = valor;
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
            if (tamanhoSelecionado != null) {
              _atualizarFluxoFormulario(tamanhoSelecionado!);
            }
          }),
        ],
      ),
    );
  }
}
