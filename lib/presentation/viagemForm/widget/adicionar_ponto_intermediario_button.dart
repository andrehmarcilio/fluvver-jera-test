import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/presentation/viagemForm/bloc/trajetoFormBloc/trajeto_form_cubit.dart';
import 'package:provider/provider.dart';

import '../view/ponto_intermediario_form_view.dart';

class AdicionarPontoButton extends StatelessWidget {
  const AdicionarPontoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TrajetoFormCubit>();
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PontoIntermediarioFormView(trajetoFormCubit: cubit))),
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
