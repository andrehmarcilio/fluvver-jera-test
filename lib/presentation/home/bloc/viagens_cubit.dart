import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/dao/viagem_dao.dart';
import '../../../domain/entity/viagem.dart';

class ViagensCubit extends Cubit<List<Viagem>> {
  final ViagemDao viagemDao;
  ViagensCubit(this.viagemDao) : super(viagemDao.getViagens());

  createViagem(Viagem viagem) async {
    await viagemDao.createViagem(viagem);
    emit(viagemDao.getViagens());
  }

}