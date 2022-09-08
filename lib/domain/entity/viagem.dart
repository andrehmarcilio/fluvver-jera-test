import 'rota.dart';
import 'veiculo.dart';
import 'volume.dart';

class Viagem {
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
}
