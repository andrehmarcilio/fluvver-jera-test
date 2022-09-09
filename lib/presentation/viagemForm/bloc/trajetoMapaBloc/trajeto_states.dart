part of 'trajeto_bloc.dart';

abstract class TrajetoMapaStates {}

class TrajetoMapaInitialState extends TrajetoMapaStates {}

class TrajetoMapaLoading extends TrajetoMapaStates {}

class TrajetoMapaSuccess extends TrajetoMapaStates {
  Directions directions;
  List<BitmapDescriptor> bitMaps;
  TrajetoMapaSuccess(this.directions, this.bitMaps);
}

class TrajetoMapaError extends TrajetoMapaStates {
  String erroMessage;

  TrajetoMapaError(this.erroMessage);
}
