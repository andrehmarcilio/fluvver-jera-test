class Lugar {
  double lat;
  double lng;
  String nome;

  Lugar({required this.lat, required this.lng, required this.nome});

  Lugar.fromApiSearchResult(Map apiResult)
      : lat = apiResult['geometry']['location']['lat'],
        lng = apiResult['geometry']['location']['lng'],
        nome = apiResult['long_name'];
}