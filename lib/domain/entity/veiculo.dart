enum Veiculo {
  carro(
      value: "carro",
      imagePath: "assets/icons/veiculos/ic_car.png",
      nome: "Carro"),
  aviao(
      value: "aviao",
      imagePath: "assets/icons/veiculos/ic_aviao.png",
      nome: "Avião"),
  caminhao(
      value: "caminhao",
      imagePath: "assets/icons/veiculos/ic_caminhao.png",
      nome: "Caminhão"),
  van(
      value: "van",
      imagePath: "assets/icons/veiculos/ic_van.png",
      nome: "Van"),
  moto(
      value: "moto",
      imagePath: "assets/icons/veiculos/ic_moto.png",
      nome: "Moto"),
  bicicleta(
      value: "bicicleta",
      imagePath: "assets/icons/veiculos/ic_bike.png",
      nome: "Bicicleta"),
  trem(
      value: "trem",
      imagePath: "assets/icons/veiculos/ic_trem.png",
      nome: "Trem"),
  onibus(
      value: "onibus",
      imagePath: "assets/icons/veiculos/ic_bus.png",
      nome: "Ônibus"),
  embarcacao(
      value: "embarcacao",
      imagePath: "assets/icons/veiculos/ic_barco.png",
      nome: "Embarcação");

  final String value;
  final String imagePath;
  final String nome;

  static pegarPeloValue(String value) => Veiculo.values.firstWhere((element) => element.value == value);

  const Veiculo(
      {required this.value, required this.imagePath, required this.nome});
}
