import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_jera_teste/data/remote/maps/maps_service.dart';
import 'package:muvver_jera_teste/domain/entity/lugar.dart';



void main() {
  test(
      "deve retornar uma lista de sugestões de cidades quando a funcao getAutoCompletePlaces for chamada",
      () async {
    // Arranje
    final service = MapsService();

    // Act
    final listaDeSugestoes = await service.getAutoCompletePlaces("Cuiab");

    // Assert
    expect(listaDeSugestoes, isA<List<Lugar>>());
  });

  test("deve retornar as direções quando chamar a funcao getDirections", () {

  });
}




