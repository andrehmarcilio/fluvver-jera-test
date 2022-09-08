import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muvver_jera_teste/domain/useCases/auto_completar_campo_cidade_use_case.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';
import 'package:muvver_jera_teste/utils/extensions/lugar_list_extensions.dart';
import 'package:muvver_jera_teste/utils/extensions/string_extensions.dart';

import '../../../domain/entity/lugar.dart';
import '../../../domain/entity/rota.dart';
import '../../../domain/entity/viagem.dart';
import '../../../utils/customDatePicker/custom_date_picker.dart';
import '../../../utils/extensions/custom_focus_node.dart';
import '../bloc/trajetoFormBloc/trajeto_form_cubit.dart';
import '../bloc/trajetoMapaBloc/trajeto_bloc.dart';
import '../widget/adicionar_ponto_intermediario_button.dart';
import '../widget/custom_auto_complete_widget.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_text_field.dart';
import '../widget/ponto_intermediario_item.dart';
import '../widget/trajeto_map.dart';

class TrajetoFormView extends StatefulWidget {
  const TrajetoFormView({Key? key,   this.popFormFlow}) : super(key: key);
  final VoidCallback? popFormFlow;
  @override
  State<TrajetoFormView> createState() => _TrajetoFormViewState();
}

class _TrajetoFormViewState extends State<TrajetoFormView>
    with TickerProviderStateMixin {
  final dataPartidaController = TextEditingController();
  final dataChegadaController = TextEditingController();

  late TabController tabController;

  List<Lugar> lugaresOrigem = [];
  List<Lugar> lugaresDestino = [];

  Lugar? cidadeOrigem;
  Lugar? cidadeDestino;

  String? dataPartidaErro;
  String? dataChegadaErro;
  String? cidadeOrigemErro;
  String? cidadeDestinoErro;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  void _atualizarFluxoFormulario(Rota rota) {
    context.flow<Viagem>().update((viagem) => viagem.copyWith(rota: rota));
  }

  @override
  Widget build(BuildContext context) {
    final trajetoMapaBloc = context.watch<TrajetoMapaBloc>();
    final trajetoFormCubit = context.watch<TrajetoFormCubit>();

    final autoCompletar = context.read<AutoCompletarCampoCidadeUseCase>();
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
                  descricao: "Qual o trajeto da sua viagem?",
                  showCancelButton: true,
                  popFormFlow: widget.popFormFlow,
                  tabBar: TabBar(
                    indicatorColor: Colors.white,
                    controller: tabController,
                    tabs: const [
                      Tab(
                        text: "Rotas",
                      ),
                      Tab(
                        text: "Mapas",
                      ),
                    ],
                  )),
              Expanded(
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      SingleChildScrollView(
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
                              const TituloText(
                                  titulo:
                                      "Selecione a data e rota da sua viagem"),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      controller: dataPartidaController,
                                      focusNode: AlwaysDisabledFocusNode(),
                                      label: "Data de partida",
                                      erro: dataPartidaErro,
                                      rightPadding: 8,
                                      onTap: () async {
                                        final date =
                                            await CustomDatePicker.show(
                                                context);
                                        if (date != null) {
                                          dataPartidaController.text = date;
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: dataChegadaController,
                                      focusNode: AlwaysDisabledFocusNode(),
                                      label: "Data de chegada",
                                      leftPadding: 8,
                                      erro: dataChegadaErro,
                                      onTap: () async {
                                        final date =
                                            await CustomDatePicker.show(
                                                context);
                                        if (date != null) {
                                          dataChegadaController.text = date;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 31,
                              ),
                              CustomAutoComplete(
                                label: "Cidade de origem",
                                erro: cidadeOrigemErro,
                                onSelected: (value) {
                                  trajetoMapaBloc.add(SelectOrigin(
                                      lugaresOrigem.pegarIdPeloNome(value)));
                                  cidadeOrigem =
                                      lugaresOrigem.pegarLugarPeloNome(value);
                                },
                                optionsBuilder: (textEdt) async {
                                  try {
                                    lugaresOrigem =
                                        await autoCompletar(textEdt.text);
                                    return lugaresOrigem.map((e) => e.nome);
                                  } catch (e) {
                                    return [];
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              BlocConsumer<TrajetoFormCubit, List<Lugar>>(
                                  listener: (context, state) {
                                trajetoMapaBloc.add(UpdateWayPoints(state));
                              }, builder: (context, state) {
                                return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.length,
                                    itemBuilder: (context, position) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: PontoIntermediarioItem(
                                            nome: state[position].nome,
                                            onPressed: () => trajetoFormCubit
                                                .removerLugar(position)),
                                      );
                                    });
                              }),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomAutoComplete(
                                label: "Cidade de destino",
                                erro: cidadeDestinoErro,
                                onSelected: (value) {
                                  trajetoMapaBloc.add(SelectDestination(
                                      lugaresDestino.pegarIdPeloNome(value)));
                                  cidadeDestino =
                                      lugaresDestino.pegarLugarPeloNome(value);
                                },
                                optionsBuilder: (textEdt) async {
                                  try {
                                    lugaresDestino =
                                        await autoCompletar(textEdt.text);
                                    return lugaresDestino.map((e) => e.nome);
                                  } catch (e) {
                                    return [];
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              const AdicionarPontoButton()
                            ],
                          ),
                        ),
                      ),
                      const TrajetoMap()
                    ]),
              ),
            ],
          ),
          CustomElevatedButton(onPress: () {
            final bool camposValidos = _verificarCampos();
            if (camposValidos) {
              _atualizarFluxoFormulario(Rota(
                  cidadeDestino: cidadeDestino!,
                  cidadeOrigem: cidadeOrigem!,
                  dataPartida: dataPartidaController.text.transformInDatetime(),
                  dataChegada: dataChegadaController.text.transformInDatetime(),
                  pontosIntermediarios: trajetoMapaBloc.wayPoints));
            }
          }),
        ],
      ),
    );
  }

  bool _verificarCampos() {
    setState(() {
      dataPartidaErro =
          dataPartidaController.text.isEmpty ? "Digite algum valor" : null;
      dataChegadaErro =
          dataChegadaController.text.isEmpty ? "Digite algum valor" : null;
      cidadeOrigemErro =
          cidadeOrigem == null ? "Selecione algum valor da lista" : null;
      cidadeDestinoErro =
          cidadeDestino == null ? "Selecione algum valor da lista" : null;
    });
    return dataPartidaErro == null &&
        dataChegadaErro == null &&
        cidadeOrigemErro == null &&
        cidadeDestinoErro == null;
  }
}
