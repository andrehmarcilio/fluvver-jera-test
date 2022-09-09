import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../domain/entity/directions.dart';
import '../../../../domain/entity/lugar.dart';
import '../../../../domain/useCases/buscar_rota_do_trajeto_use_case.dart';

part 'trajeto_events.dart';

part 'trajeto_states.dart';

class TrajetoMapaBloc extends Bloc<TrajetoEvents, TrajetoMapaStates> {
  BuscarRotaTrajetoUseCase buscarRotaTrajetoUseCase;
  String? originId;
  String? destinationId;
  List<Lugar> wayPoints = [];

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
        emit(TrajetoMapaSuccess(directions, await getBitMaps()));
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
        emit(TrajetoMapaSuccess(directions, await getBitMaps()));
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

        emit(TrajetoMapaSuccess(directions, await getBitMaps()));
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

  Future<List<BitmapDescriptor>> getBitMaps() async {
   final iconPartida = BitmapDescriptor.fromBytes(
      await getBytesFromAsset("assets/icons/ic-partida.png", 150),
    );

    final iconDestino =  BitmapDescriptor.fromBytes(
       await getBytesFromAsset("assets/icons/ic-destino.png", 150),
    );

    return [iconPartida,iconDestino];
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
