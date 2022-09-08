import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Directions {
  Coordinate boundsNe;
  Coordinate boundsSw;
  Coordinate startLocation;
  Coordinate endLocation;
  String polyline;
  List<PointLatLng> polylineDecoded;

  Directions({required this.boundsNe,
    required this.boundsSw,
    required this.startLocation,
    required this.endLocation,
    required this.polyline,
    required this.polylineDecoded});

  Directions.fromJson(Map json)
      :
        boundsNe = Coordinate.fromJson(json['routes'][0]['bounds']['northeast']),
        boundsSw = Coordinate.fromJson(json['routes'][0]['bounds']['southwest']),
        startLocation = Coordinate.fromJson(json['routes'][0]['legs'][0]['start_location']),
        endLocation = Coordinate.fromJson(json['routes'][0]['legs'][0]['end_location']),
        polyline = json['routes'][0]['overview_polyline']['points'],
        polylineDecoded = PolylinePoints().decodePolyline(json['routes'][0]['overview_polyline']['points']);


}

class Coordinate {
  double latitude;
  double longitude;

  Coordinate({required this.latitude, required this.longitude});

  Coordinate.fromJson(Map json)
      : latitude = json['lat'],
        longitude = json['lng'];
}
