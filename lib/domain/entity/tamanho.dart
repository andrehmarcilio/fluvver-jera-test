enum Tamanho {
  envelope(
      value: "envelope",
      imagePath: "assets/icons/tamanhos/ic_email.png",
      nome: "Envelope",
      dimensoes: "09 x 22 cm"),
  livro(
      value: "livro",
      imagePath: "assets/icons/tamanhos/ic_book.png",
      nome: "Livro",
      dimensoes: "21 x 28 cm"),
  caixaSapato(
      value: "caixa-de-sapato",
      imagePath: "assets/icons/tamanhos/ic_box.png",
      nome: "Caixa de sapato",
      dimensoes: "35 x 20 cm"),
  mochila(
      value: "mochila",
      imagePath: "assets/icons/tamanhos/ic_backpack.png",
      nome: "Mochila",
      dimensoes: "31 x 48 cm"),
  malaGrande(
      value: "mala-grande",
      imagePath: "assets/icons/tamanhos/ic_mala.png",
      nome: "Mala grande",
      dimensoes: "31 x 48 cm"),
  caixaGrande(
      value: "caixa-grande",
      imagePath: "assets/icons/tamanhos/ic_big_box.png",
      nome: "Caixa Grande",
      dimensoes: "77 x 45 cm");

  final String value;
  final String imagePath;
  final String nome;
  final String dimensoes;

  static pegarPeloValue(String value) =>
      Tamanho.values.firstWhere((element) => element.value == value);

  const Tamanho(
      {required this.value, required this.imagePath, required this.nome, required this.dimensoes});
}
