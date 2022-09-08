import 'peso.dart';
import 'tamanho.dart';

class Volume {
  Tamanho? tamanho;
  Peso? peso;

  Volume({this.tamanho, this.peso});

  Volume copyWith({Tamanho? tamanho, Peso? peso}) {
    return Volume(
      tamanho: tamanho ?? this.tamanho,
      peso: peso ?? this.peso
    );
  }
}