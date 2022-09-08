import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/lugar_auto_complete.dart';

class TrajetoFormCubit extends Cubit<List<LugarAutoComplete>> {
  TrajetoFormCubit() : super([]);

  adicionarLugar(List<LugarAutoComplete> lugares) {
   state.addAll(lugares);
   emit(state.toList());
  }

  removerLugar(int index) {
    state.removeAt(index);
    emit(state.toList());
  }

}