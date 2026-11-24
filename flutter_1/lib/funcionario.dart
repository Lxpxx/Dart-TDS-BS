class Funcionario extends Pessoa {
  final int id;
  final String cargo;
  final double salario;

  Funcionario({
    required super.nome,
    required super.cpf,
    required super.rg,
    required super.dataNascimento,
    required this.id,
    required this.cargo,
    required this.salario,
  });

  @override
  void cadastrar() {
    print("Funcionário $nome registado na equipa.");
  }
}