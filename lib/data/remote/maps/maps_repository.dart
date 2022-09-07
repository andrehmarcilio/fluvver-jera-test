import '../../../domain/entity/lugar.dart';
import '../../../domain/entity/lugar_auto_complete.dart';
import '../../../domain/repository/imaps_repository.dart';
import 'maps_service.dart';

class MapsRepository extends IMapsRepository {

  MapsService mapsService;
  MapsRepository(this.mapsService);

  @override
  Future<List<LugarAutoComplete>> getAutoCompletePlaces(String text) {
    return mapsService.getAutoCompletePlaces(text);
  }

  @override
  Future<Lugar> getPlaceInfo(String id) {
    throw UnimplementedError();
  }

}