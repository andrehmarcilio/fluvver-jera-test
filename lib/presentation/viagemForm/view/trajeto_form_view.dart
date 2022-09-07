import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/data/remote/maps/maps_repository.dart';
import 'package:muvver_jera_teste/data/remote/maps/maps_service.dart';
import 'package:muvver_jera_teste/domain/useCases/auto_completar_campo_cidade_use_case.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/widget/titulo_text.dart';

import '../../../domain/entity/lugar_auto_complete.dart';
import '../widget/custom_auto_complete_widget.dart';
import '../widget/custom_elevated_button.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_text_field.dart';
import 'ponto_intermediario_form_view.dart';
import 'tamanho_form_view.dart';

class TrajetoFormView extends StatefulWidget {
  const TrajetoFormView({Key? key}) : super(key: key);

  @override
  State<TrajetoFormView> createState() => _TrajetoFormViewState();
}

class _TrajetoFormViewState extends State<TrajetoFormView>
    with TickerProviderStateMixin {
  final dataPartidaController = TextEditingController();

  final dataChegadaController = TextEditingController();

  late TabController tabController;

  final autoCompletar =
      AutoCompletarCampoCidadeUseCase(MapsRepository(MapsService()));

  List<LugarAutoComplete> lugaresOrigem = [];
  List<LugarAutoComplete> lugaresDestino = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
                  descricao: "Qual o trajeto da sua viagem?",
                  showCancelButton: true,
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
                child: TabBarView(controller: tabController, children: [
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
                              titulo: "Selecione a data e rota da sua viagem"),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: dataPartidaController,
                                  label: "Data de partida",
                                  rightPadding: 8,
                                ),
                              ),
                              Expanded(
                                child: CustomTextField(
                                  controller: dataChegadaController,
                                  label: "Data de chegada",
                                  leftPadding: 8,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 31,
                          ),
                          CustomAutoComplete(
                            label: "Cidade de origem",
                            onSelected: (value) {},
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
                            height: 30,
                          ),
                          CustomAutoComplete(
                            label: "Cidade de destino",
                            onSelected: (value) {},
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
                  Container(
                    width: 24,
                    height: 24,
                    color: Colors.green,
                  )
                ]),
              ),
            ],
          ),
          CustomElevatedButton(
              onPress: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TamanhoFormView()))),
        ],
      ),
    );
  }
}

class AdicionarPontoButton extends StatelessWidget {
  const AdicionarPontoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PontoIntermediarioFormView())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/icons/ic_add_circle_outline.png",
            height: 24,
            width: 24,
          ),
          const SizedBox(
            width: 8.5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 24,
                alignment: Alignment.center,
                child: const Text(
                  "Adicionar ponto intermediário",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              const Text(
                "E aumente sua chance de match",
                style: TextStyle(fontSize: 14, color: Color(0xFF808080)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
