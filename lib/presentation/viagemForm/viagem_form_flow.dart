import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/local/dao/viagem_dao.dart';
import '../../domain/entity/viagem.dart';
import 'view/peso_form_view.dart';
import 'view/preco_form_view.dart';
import 'view/tamanho_form_view.dart';
import 'view/trajeto_form_view.dart';
import 'view/veiculo_form_view.dart';

class ViagemFormFlow extends StatelessWidget {
  const ViagemFormFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viagemDao = context.read<ViagemDao>();
    return FlowBuilder<Viagem>(
      state: Viagem(),
      onComplete: (viagem) async {
        viagemDao.createViagem(viagem);
        Navigator.of(context).popAndPushNamed("/viagem-criada");
      },
      onGeneratePages: (viagem, pages) {
        return [
          MaterialPage(
              child: VeiculoFormView(
            popFormFlow: () => Navigator.of(context).pop(),
          )),
          if (viagem.veiculo != null)
            MaterialPage(
                child: TrajetoFormContainer(
              popFormFlow: () => Navigator.of(context).pop(),
            )),
          if (viagem.rota != null)
             MaterialPage(
                child: TamanhoFormView(
              popFormFlow: () => Navigator.of(context).pop(),
            )),
          if (viagem.volume?.tamanho != null)
             MaterialPage(
                child: PesoFormView(
              popFormFlow: () => Navigator.of(context).pop(),
            )),
          if (viagem.volume?.peso != null)
            MaterialPage(
                child: PrecoFormView(
              popFormFlow: () => Navigator.of(context).pop(),
            )),
        ];
      },
    );
  }
}
