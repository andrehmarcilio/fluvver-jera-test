

import 'package:flutter_test/flutter_test.dart';
import 'package:muvver_jera_teste/utils/extensions/string_list_extensions.dart';

void main() {
  test(
      "deve retornar os WayPoints formatadas quando a funcao de extensão for chamada",
          () async {
        // Arranje
        List<String> wayPoints = ["id1", "id2", "id3"];

        // Act
        String wayPointsFormatados =  wayPoints.formatWayPoints();

        // Assert
        expect(wayPointsFormatados, equals("place_id:id1|place_id:id2|place_id:id3"));
      });
}