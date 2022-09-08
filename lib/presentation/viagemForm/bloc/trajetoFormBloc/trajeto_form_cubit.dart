import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/lugar.dart';

class TrajetoFormCubit extends Cubit<List<Lugar>> {
  TrajetoFormCubit() : super([]);

  adicionarLugar(List<Lugar> lugares) {
   state.addAll(lugares);
   emit(state.toList());
  }

  removerLugar(int index) {
    state.removeAt(index);
    emit(state.toList());
  }

}