import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/directions.dart';
import '../../../../domain/entity/lugar_auto_complete.dart';
import '../../../../domain/useCases/buscar_rota_do_trajeto_use_case.dart';

part 'trajeto_events.dart';

part 'trajeto_states.dart';

class TrajetoMapaBloc extends Bloc<TrajetoEvents, TrajetoMapaStates> {
  BuscarRotaTrajetoUseCase buscarRotaTrajetoUseCase;
  String? originId;
  String? destinationId;
  List<LugarAutoComplete> wayPoints = [];

  TrajetoMapaBloc(this.buscarRotaTrajetoUseCase)
      : super(TrajetoMapaInitialState()) {
    on<SelectOrigin>(_selectOrigin);
    on<SelectDestination>(_selectDestination);
    on<UpdateWayPoints>(_updateWayPoints);
  }

  FutureOr<void> _selectOrigin(
      SelectOrigin event, Emitter<TrajetoMapaStates> emit) async {
    originId = event.originId;
    if (originId != null && destinationId != null) {
      emit(TrajetoMapaLoading());
      try {
        final directions = await _buscarDirecoes(originId!, destinationId!);
        emit(TrajetoMapaSuccess(directions));
      } catch (e) {
        emit(TrajetoMapaError(e.toString()));
      }
    }
  }

  FutureOr<void> _selectDestination(
      SelectDestination event, Emitter<TrajetoMapaStates> emit) async {
    destinationId = event.destinationId;
    if (originId != null && destinationId != null) {
      emit(TrajetoMapaLoading());
      try {
        final directions = await _buscarDirecoes(originId!, destinationId!);
        emit(TrajetoMapaSuccess(directions));
      } catch (e) {
        emit(TrajetoMapaError(e.toString()));
      }
    }
  }

  FutureOr<void> _updateWayPoints(
      UpdateWayPoints event, Emitter<TrajetoMapaStates> emit) async {
    wayPoints = event.wayPoints;
    if (originId != null && destinationId != null) {
      emit(TrajetoMapaLoading());
      try {
        final directions = await _buscarDirecoes(originId!, destinationId!);
        emit(TrajetoMapaSuccess(directions));
      } catch (e) {
        emit(TrajetoMapaError(e.toString()));
      }
    }
  }


  Future<Directions> _buscarDirecoes(
      String originId, String destinationId) async {
    try {
      final direcoes =
          await buscarRotaTrajetoUseCase(originId, destinationId, wayPoints.map((e) => e.id).toList());
      return direcoes;
    } catch (e) {
      throw Exception();
    }
  }
}
