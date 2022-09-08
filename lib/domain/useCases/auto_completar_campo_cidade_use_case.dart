import '../entity/lugar.dart';
import '../repository/imaps_repository.dart';

class AutoCompletarCampoCidadeUseCase {
  IMapsRepository mapsRepository;

  AutoCompletarCampoCidadeUseCase(this.mapsRepository);

  Future<List<Lugar>> call(String text) =>
      mapsRepository.getAutoCompletePlaces(text);
}
