

abstract class Pessoa {

  //Atributos

  final String nome;
  final String _cpf; //privado
  final int rg;
  final DateTime dataNascimento;

  //Construtor

  Pessoa({
    required this.nome,
    required String cpf,
    required this.rg,
    required this.dataNascimento,

  }) : _cpf = cpf;

  //Getter

  String get cpf => _cpf;
  void cadastrar();

}