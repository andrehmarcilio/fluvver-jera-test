import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:muvver_jera_teste/utils/extensions/string_list_extensions.dart';

import '../../../domain/entity/directions.dart';
import '../../../domain/entity/lugar.dart';

const API_KEY = 'CHAVE_SECRETA';
const baseUrl = "https://maps.googleapis.com/maps/api";

class MapsService {
  Future<List<Lugar>> getAutoCompletePlaces(String text) async {
    final response = await http.get(Uri.parse(
        "$baseUrl/place/autocomplete/json?input=$text&components=country:br&language=pt_BR&key=$API_KEY"));
    final json = jsonDecode(response.body) as Map;
    if (json['status'] == 'OK') {
      final lugares = (json['predictions'] as List)
          .map((json) => Lugar.fromJson(json))
          .toList();
      return lugares;
    } else {
      throw Exception();
    }
  }

  Future<Directions> getDirections(
      String originId, String destinationId, List<String>? wayPoints) async {
    try {
      String url;
      if (wayPoints != null) {
        String wayPointsString = wayPoints.formatWayPoints();
        url =
            "$baseUrl/directions/json?origin=place_id:$originId&destination=place_id:$destinationId&waypoints=$wayPointsString&key=$API_KEY";
      } else {
        url =
            "$baseUrl/directions/json?origin=place_id:$originId&destination=place_id:$destinationId&key=$API_KEY";
      }
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body) as Map;
      return Directions.fromJson(json);
    } catch (e) {
      throw Exception();
    }
  }
}
