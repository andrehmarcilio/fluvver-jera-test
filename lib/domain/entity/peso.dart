enum Peso {
  peso1(value: "ate-1-kg", imagePath: "assets/icons/pesos/ic_balance_1.png", nome: "Até 1 kg"),
  peso2(value: "ate-5-kg", imagePath: "assets/icons/pesos/ic_balance_2.png", nome: "Até 5 kg"),
  peso3(value: "ate-10-kg", imagePath: "assets/icons/pesos/ic_balance_3.png", nome: "Até 10 kg"),
  peso4(value: "ate-20-kg", imagePath: "assets/icons/pesos/ic_balance_4.png", nome: "Até 20 kg"),
  peso5(value: "outro", imagePath: "assets/icons/pesos/ic_balance_5.png", nome: "Outro");

  final String value;
  final String nome;
  final String imagePath;

  const Peso(
      {required this.imagePath, required this.value, required this.nome});
}
