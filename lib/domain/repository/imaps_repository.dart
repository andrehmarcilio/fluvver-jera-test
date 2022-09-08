import '../entity/directions.dart';
import '../entity/lugar.dart';

abstract class IMapsRepository {
  Future<List<Lugar>> getAutoCompletePlaces(String text);

  Future<Directions> getDirections(
      String originId, String destinationId, List<String>? wayPoints);
}
