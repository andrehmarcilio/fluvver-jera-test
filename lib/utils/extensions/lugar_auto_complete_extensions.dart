import 'package:muvver_jera_teste/domain/entity/lugar.dart';

extension SearchLugar on List<Lugar> {
  Lugar pegarLugarPeloNome( String nome) {
    final lugar = firstWhere((lugar) => lugar.nome == nome,
        orElse: () => this[0]);
    return lugar;
  }
}