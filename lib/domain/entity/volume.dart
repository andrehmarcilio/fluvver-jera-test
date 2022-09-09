import 'peso.dart';
import 'tamanho.dart';

class Volume {
  Tamanho? tamanho;
  Peso? peso;

  Volume({this.tamanho, this.peso});

  Volume copyWith({Tamanho? tamanho, Peso? peso}) {
    return Volume(tamanho: tamanho ?? this.tamanho, peso: peso ?? this.peso);
  }

  Map toMap() {
    return {"tamanho": tamanho?.value, "peso": peso?.value};
  }

  Volume.fromMap(Map map)
      : tamanho = Tamanho.pegarPeloValue(map["tamanho"]),
        peso = Peso.pegarPeloValue(map["peso"]);
}
