import 'package:muvver_jera_teste/domain/entity/lugar_auto_complete.dart';

extension SearchLugar on List<LugarAutoComplete> {
  LugarAutoComplete pegarLugarPeloNome( String nome) {
    final lugar = firstWhere((lugar) => lugar.nome == nome,
        orElse: () => this[0]);
    return lugar;
  }
}