import '../entity/directions.dart';
import '../repository/imaps_repository.dart';

class BuscarRotaTrajetoUseCase {
  IMapsRepository repository;
  BuscarRotaTrajetoUseCase(this.repository);

  Future<Directions> call(String originId, String destinationId, List<String>? wayPoints) =>
      repository.getDirections(originId, destinationId, wayPoints);
}