import 'lugar.dart';

class Rota {
  DateTime dataPartida;
  DateTime dataChegada;
  Lugar cidadeOrigem;
  Lugar cidadeDestino;
  List<Lugar> pontosIntermediarios;

  Rota(
      {required this.dataPartida,
      required this.dataChegada,
      required this.cidadeOrigem,
      required this.cidadeDestino,
      required this.pontosIntermediarios});

  @override
  String toString() {
    return "Rota (dataPartida : $dataPartida, dataChegada : $dataChegada, cidadeOrigem : ${cidadeOrigem.nome}, cidadeDestino : ${cidadeDestino.nome}, pontosIntermediarios : $pontosIntermediarios)";
  }
}