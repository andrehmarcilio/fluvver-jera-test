import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/home/widget/inicio_feature_item.dart';

import '../../viagemForm/viagem_form_flow.dart';

class InicioBody extends StatelessWidget {
  const InicioBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Facilitando seus ',
              style: TextStyle(
                fontSize: 20,
                height: 1.3,
                color: Color(0xFF222222),
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'envios',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Entregue ou envie.",
            style: TextStyle(
              fontSize: 16,
              height: 1.3,
              color: Color(0xFF808080),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          InicioFeatureItem(
              onPressed: () {},
              featureImage: Image.asset("assets/images/inicio/ic-box.png"),
              titulo: "Remetente",
              descricao: "Pra onde quer enviar seu objeto?"),
          const SizedBox(
            height: 24,
          ),
          InicioFeatureItem(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ViagemFormFlow())),
              featureImage:
                  Image.asset("assets/images/inicio/delivery-truck.png"),
              titulo: "Viajante",
              descricao: "Vai viajar para onde?\n  "),
        ],
      ),
    );
  }
}
