class Doacao {
  final int id;
  final DateTime dataDoacao;
  final int volumeMl;

  Doacao({required this.id, required this.dataDoacao, required this.volumeMl});

  void registrarDoacao() {
    print("Doação de ${volumeMl}ml registada.");
  }
}