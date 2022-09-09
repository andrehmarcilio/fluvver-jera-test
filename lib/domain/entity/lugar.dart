class Lugar {
  String id;
  String nome;

  Lugar({required this.id, required this.nome});

  Lugar.fromJson(Map json)
      : nome = json['description'],
        id = json['place_id'];

  Map toMap() {
    return {
      "place_id": id,
       "description": nome
    };
  }

  @override
  String toString() {
    return nome;
  }
}