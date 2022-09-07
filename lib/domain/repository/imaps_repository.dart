import '../entity/lugar.dart';
import '../entity/lugar_auto_complete.dart';

abstract class IMapsRepository {
    Future<List<LugarAutoComplete>> getAutoCompletePlaces(String text);
    Future<Lugar> getPlaceInfo(String id);
}