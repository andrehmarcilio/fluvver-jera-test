import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/custom_app_bar.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';
import 'package:muvver_jera_teste/utils/extensions/lugar_list_extensions.dart';

import '../../../data/remote/maps/maps_repository.dart';
import '../../../data/remote/maps/maps_service.dart';
import '../../../domain/entity/lugar.dart';
import '../../../domain/useCases/auto_completar_campo_cidade_use_case.dart';
import '../bloc/trajetoFormBloc/trajeto_form_cubit.dart';
import '../bloc/trajetoMapaBloc/trajeto_bloc.dart';
import '../widget/custom_auto_complete_widget.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/ponto_intermediario_item.dart';

class PontoIntermediarioFormView extends StatefulWidget {
  const PontoIntermediarioFormView({Key? key}) : super(key: key);

  @override
  State<PontoIntermediarioFormView> createState() =>
      _PontoIntermediarioFormViewState();
}

class _PontoIntermediarioFormViewState
    extends State<PontoIntermediarioFormView> {
  List<Lugar> lugares = [];
  List<Lugar> lugaresSelecionados = [];

  final autoCompletar =
      AutoCompletarCampoCidadeUseCase(MapsRepository(MapsService()));

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TrajetoFormCubit>();
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
              Expanded(child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    CustomAutoComplete(
                      label: "Nome da cidade",
                      onSelected: (value) {
                        setState(() {
                          lugaresSelecionados
                              .add(lugares.pegarLugarPeloNome(value));
                        });
                      },
                      optionsBuilder: (textEdt) async {
                        try {
                          lugares = await autoCompletar(textEdt.text);
                          return lugares.map((e) => e.nome);
                        } catch (e) {
                          return [];
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Lugares selecionados:",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lugaresSelecionados.length,
                        itemBuilder: (context, position) {
                          return PontoIntermediarioItem(
                              nome: lugaresSelecionados[position].nome,
                              onPressed: () => setState(() {
                                    lugaresSelecionados.removeAt(position);
                                  }));
                        })
                  ],
                ),
              )),
            ],
          ),
          CustomElevatedButton(
            onPress: () {
              cubit.adicionarLugar(lugaresSelecionados);
              Navigator.of(context).pop();
            },
            text: "Confirmar",
          ),
        ],
      ),
    );
  }
}
