class Bolsa {
  final String codigoBolsa;
  final String status;
  final DateTime dataValidade;

  Bolsa({
    required this.codigoBolsa,
    required this.status,
    required this.dataValidade,
  });

  bool verificarValidade() {
    return dataValidade.isAfter(DateTime.now());
  }
}
