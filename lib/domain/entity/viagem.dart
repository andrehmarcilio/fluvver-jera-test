import 'package:muvver_jera_teste/utils/extensions/enum_extensions.dart';
import 'package:uuid/uuid.dart';

import 'rota.dart';
import 'veiculo.dart';
import 'volume.dart';

class Viagem {
  String id = const Uuid().v4();
  Veiculo? veiculo;
  Rota? rota;
  Volume? volume;
  double? preco;

  Viagem({this.veiculo, this.rota, this.volume, this.preco});

  Viagem copyWith(
      {Veiculo? veiculo, Rota? rota, Volume? volume, double? preco}) {
    return Viagem(
        veiculo: veiculo ?? this.veiculo,
        rota: rota ?? this.rota,
        volume: volume ?? this.volume,
        preco: preco ?? this.preco);
  }

  @override
  String toString() {
    return "Viagem (veiculo : ${veiculo?.nome}, rota - $rota, volume - Volume(tamanho: ${volume?.tamanho?.nome}, peso: ${volume?.peso?.nome}))";
  }

  Map toMap() {
    Map mapa = {};
    mapa["viagemId"] = id;
    mapa["veiculo"] = veiculo?.value;
    mapa["rota"] = rota?.toMap();
    mapa["volume"] = volume?.toMap();
    mapa["preco"] = preco;
    return {id: mapa};
  }

  Viagem.fromMap(Map map)
      : id = map["viagemId"],
        veiculo = Veiculo.pegarPeloValue(map["veiculo"]),
        rota = Rota.fromMap(map["rota"]),
        volume = Volume.fromMap(map["volume"]),
        preco = map["preco"];
}
