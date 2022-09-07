import '../entity/lugar_auto_complete.dart';
import '../repository/imaps_repository.dart';

class AutoCompletarCampoCidadeUseCase {
  IMapsRepository mapsRepository;

  AutoCompletarCampoCidadeUseCase(this.mapsRepository);

  Future<List<LugarAutoComplete>> call(String text) =>
      mapsRepository.getAutoCompletePlaces(text);
}
