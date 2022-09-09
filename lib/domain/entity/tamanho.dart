enum Tamanho {
  envelope(
      value: "envelope",
      imagePath: "assets/icons/tamanhos/ic_email.png",
      nome: "Envelope"),
  livro(
      value: "livro",
      imagePath: "assets/icons/tamanhos/ic_book.png",
      nome: "Livro"),
  caixaSapato(
      value: "caixa-de-sapato",
      imagePath: "assets/icons/tamanhos/ic_box.png",
      nome: "Caixa de sapato"),
  mochila(
      value: "mochila",
      imagePath: "assets/icons/tamanhos/ic_backpack.png",
      nome: "Mochila"),
  malaGrande(
      value: "mala-grande",
      imagePath: "assets/icons/tamanhos/ic_mala.png",
      nome: "Mala grande"),
  caixaGrande(
      value: "caixa-grande",
      imagePath: "assets/icons/tamanhos/ic_big_box.png",
      nome: "Caixa Grande");

  final String value;
  final String imagePath;
  final String nome;

  static pegarPeloValue(String value) =>
      Tamanho.values.firstWhere((element) => element.value == value);

  const Tamanho(
      {required this.value, required this.imagePath, required this.nome});
}
