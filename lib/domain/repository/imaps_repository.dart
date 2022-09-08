import '../entity/directions.dart';
import '../entity/lugar_auto_complete.dart';

abstract class IMapsRepository {
  Future<List<LugarAutoComplete>> getAutoCompletePlaces(String text);

  Future<Directions> getDirections(
      String originId, String destinationId, List<String>? wayPoints);
}
