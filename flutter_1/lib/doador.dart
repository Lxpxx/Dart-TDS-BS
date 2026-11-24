import 'pessoa.dart';

class Doador extends Pessoa {
  // Atributos
  final int id;
  final String tipoSanguineo;
  final String? observacaoMedica; // pd ser nulo

  // Construtor
  Doador({
    required super.nome,
    required super.cpf,
    required super.rg,
    required super.dataNascimento,
    required this.id,
    required this.tipoSanguineo,
    this.observacaoMedica,
  });

  bool verificarElegibilidade() {
    final hoje = DateTime.now();
    int idade = hoje.year - dataNascimento.year;
    if (hoje.month < dataNascimento.month ||
        (hoje.month == dataNascimento.month && hoje.day < dataNascimento.day)) {
      idade--;
    }
    return idade >= 18 && idade <= 69;
  }

  @override
  void cadastrar() {
    print("Doador $nome registrado no banco de sangue.");
  }
}
