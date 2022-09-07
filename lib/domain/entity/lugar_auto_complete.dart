class LugarAutoComplete {
  String id;
  String nome;

  LugarAutoComplete({required this.id, required this.nome});

  LugarAutoComplete.fromJson(Map json)
      : nome = json['description'],
        id = json['place_id'];
}