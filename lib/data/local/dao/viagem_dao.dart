import 'package:hive/hive.dart';

import '../../../domain/entity/viagem.dart';


class ViagemDao {
  final Box<Map> _hive;
  ViagemDao(this._hive);

  static const String _viagemKey = 'my_viagem';

  List<Viagem> getViagens() {
    final List<Viagem> viagens = [];
    final viagensMap = _hive.get(_viagemKey);
    if (viagensMap != null) {
      viagensMap.forEach((_, value) {
        viagens.add(Viagem.fromMap(value));
      });
      return viagens;
    } else {
      return [];
    }
  }


  Future<void> createViagem(Viagem viagem) async {
    final List<Viagem> viagens = getViagens();
    final Map viagensMap = {};
    viagens.add(viagem);

    for (var element in viagens) {
      viagensMap.addAll(element.toMap());
    }
    await _hive.put(_viagemKey, viagensMap);
  }


}
