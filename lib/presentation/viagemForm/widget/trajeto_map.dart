import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/trajetoMapaBloc/trajeto_bloc.dart';

class TrajetoMap extends StatefulWidget {
  const TrajetoMap({Key? key}) : super(key: key);

  @override
  State<TrajetoMap> createState() => TrajetoMapState();
}

class TrajetoMapState extends State<TrajetoMap> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Polyline> _polylines = {};

  int i = 0;

  Set<Marker> getMarkers(LatLng startPos, LatLng endPos,
      BitmapDescriptor iconPartida, BitmapDescriptor iconDestino) {
    return {
      Marker(
          markerId: const MarkerId("origin"),
          position: startPos,
          icon: iconPartida,
          anchor: const Offset(0.5, 0.5)),
      Marker(
          markerId: const MarkerId("destiny"),
          position: endPos,
          icon: iconDestino,
          anchor: const Offset(0.5, 0.5))
    };
  }

  String _getId() => "polyline${i++}";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrajetoMapaBloc, TrajetoMapaStates>(
      builder: (context, state) {
        if (state is TrajetoMapaSuccess) {
          _polylines.clear();
          _polylines.add(Polyline(
            polylineId: PolylineId(_getId()),
            width: 3,
            color: Colors.green,
            points: state.directions.polylineDecoded
                .map((p) => LatLng(p.latitude, p.longitude))
                .toList(),
          ));
          return GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(state.directions.startLocation.latitude,
                  state.directions.startLocation.longitude),
              zoom: 10.4746,
            ),
            markers: getMarkers(
                LatLng(state.directions.startLocation.latitude,
                    state.directions.startLocation.longitude),
                LatLng(state.directions.endLocation.latitude,
                    state.directions.endLocation.longitude),
                state.bitMaps[0],
                state.bitMaps[1]),
            polylines: _polylines,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.animateCamera(CameraUpdate.newLatLngBounds(
                  LatLngBounds(
                      southwest: LatLng(state.directions.boundsSw.latitude,
                          state.directions.boundsSw.longitude),
                      northeast: LatLng(state.directions.boundsNe.latitude,
                          state.directions.boundsNe.longitude)),
                  16));
            },
          );
        }
        if (state is TrajetoMapaInitialState) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Image.asset("assets/images/escrever.png", width: 140,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Ops.. Campos faltando", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Padding(
                   padding: EdgeInsets.symmetric(horizontal: 16.0),
                   child: Text(
                      "Escolha uma Origem e um Destino no formulário para gerarmos sua rota ;)",
                textAlign: TextAlign.center,),
                 ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          );
        }
        if (state is TrajetoMapaLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TrajetoMapaError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Ocorreu algum erro", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                ),
                 SizedBox(
                  height: 14,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Por favor, verifique sua conexão com a internet e tente novamente",
                    textAlign: TextAlign.center,),
                ),
                 SizedBox(
                  height: 60,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
