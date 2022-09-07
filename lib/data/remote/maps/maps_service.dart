import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/entity/lugar_auto_complete.dart';


const API_KEY = 'AIzaSyBDVfV5Cau-P6vzVjAJBaCZL4WnTx90TDg';

class MapsService {
  Future<List<LugarAutoComplete>> getAutoCompletePlaces(String text) async {
    final reponse = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&key=$API_KEY"));
    final json = jsonDecode(reponse.body) as Map;
    if (json['status'] == 'OK') {
      final lugares = (json['predictions'] as List).map((json) => LugarAutoComplete.fromJson(json)).toList();
      return lugares;
    } else {
      throw Exception();
    }
  }
}
