

import '../../domain/entity/peso.dart';
import '../../domain/entity/tamanho.dart';
import '../../domain/entity/veiculo.dart';

extension VeiculoSearch on Veiculo {
  Veiculo pegarPeloValue(String value) {
    return Veiculo.values.firstWhere((element) => element.value == value);
  }
}



extension PesoSearch on Peso {
  Peso pegarPeloValue(String value) {
    return Peso.values.firstWhere((element) => element.value == value);
  }
}