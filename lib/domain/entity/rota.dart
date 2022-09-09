import 'dart:collection';

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

  Map toMap() {
    return {
      "dataPartida": dataPartida.toString(),
      "dataChegada": dataChegada.toString(),
      "cidadeOrigem": cidadeOrigem.toMap(),
      "cidadeDestino": cidadeDestino.toMap(),
      "pontosIntermediarios":
          pontosIntermediarios.map((ponto) => ponto.toMap()).toList()
    };
  }

  Rota.fromMap(Map map)
      : dataPartida = DateTime.parse(map["dataPartida"]),
        dataChegada = DateTime.parse(map["dataChegada"]),
        cidadeOrigem = Lugar.fromJson(map["cidadeOrigem"]),
        cidadeDestino = Lugar.fromJson(map["cidadeDestino"]),
        pontosIntermediarios = getPontosIntermediarios(map["pontosIntermediarios"]);

}

List<Lugar> getPontosIntermediarios(List<dynamic> lista) {
  List<Lugar> lugares = [];
  lista.forEach((element) {
    lugares.add(Lugar(id: element["place_id"], nome: element["description"]));
  });
  return lugares;
}

//map["pontosIntermediarios"].map((Map ponto) => Lugar.fromJson(ponto)) .toList();