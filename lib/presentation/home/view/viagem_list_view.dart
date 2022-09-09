import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/data/local/dao/viagem_dao.dart';
import 'package:muvver_jera_teste/domain/entity/veiculo.dart';
import 'package:muvver_jera_teste/utils/extensions/date_time_extensions.dart';
import 'package:provider/provider.dart';

import '../../viagemForm/widget/custom_app_bar.dart';
import '../../viagemForm/widget/custom_divider.dart';
import '../../viagemForm/widget/titulo_text.dart';

class ViagemListView extends StatelessWidget {
  const ViagemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viagens = context.read<ViagemDao>().getViagens();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            titulo: "Suas Viagens",
            descricao:
                "Aqui você pode visualizar todas as viagens que foram criadas no App",
            showCloseButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                top: false,
                left: false,
                right: false,
                minimum: const EdgeInsets.only(bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const TituloText(titulo: "Viagens"),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: viagens.length,
                      itemBuilder: (context, position) {
                        final viagem = viagens[position];
                        return ListTile(
                          leading: Image.asset(viagem.veiculo?.imagePath ??
                              Veiculo.carro.imagePath),
                          title: RichText(
                            text:  TextSpan(
                              text: 'Origem: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Color(0xFF222222),

                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '${viagem.rota?.cidadeOrigem ?? ""}\n',
                                    style: const TextStyle(fontWeight: FontWeight.normal)),
                                const TextSpan(
                                    text: 'Destino: ',),
                                TextSpan(
                                    text: '${viagem.rota?.cidadeDestino ?? ""}',
                                    style: const TextStyle(fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          subtitle: Text(
                              "${viagem.rota?.dataPartida.formatBr() ?? ""} - ${viagem.rota?.dataChegada.formatBr() ?? ""}"),
                          trailing: Text(
                              "R\$ ${viagem.preco?.toStringAsFixed(2) ?? ""}"),
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
    );
  }
}
