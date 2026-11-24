import 'package:flutter/material.dart'; //widgets
import 'pessoa.dart';
import 'doador.dart';
import 'funcionario.dart';

void main() {
  runApp(const BancoSangueApp());
}

class BancoSangueApp extends StatelessWidget {
  const BancoSangueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banco de Sangue',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const ListaPessoasTela(),
    );
  }
}

class ListaPessoasTela extends StatelessWidget {
  const ListaPessoasTela({super.key});

  @override
  Widget build(BuildContext context) {
    
    //lista
    final List<Pessoa> listaPessoas = [
      Doador(
        nome: "Ana Silva",
        cpf: "111.111.111-11",
        rg: 1234567,
        dataNascimento: DateTime(1998, 5, 14),
        id: 1,
        tipoSanguineo: "O+",
        observacaoMedica: "Doadora frequente",
      ),
      Doador(
        nome: "João Pedro",
        cpf: "222.222.222-22",
        rg: 7654321,
        dataNascimento: DateTime(2012, 8, 20), // Menor de idade (inelegível)
        id: 2,
        tipoSanguineo: "A-",
      ),
      Funcionario(
        nome: "Carlos Souza",
        cpf: "333.333.333-33",
        rg: 1122334,
        dataNascimento: DateTime(1985, 2, 10),
        id: 3,
        cargo: "Enfermeiro Chefe",
        salario: 4200.00,
      ),
      Doador(
        nome: "Mariana Costa",
        cpf: "444.444.444-44",
        rg: 4433221,
        dataNascimento: DateTime(1992, 11, 30),
        id: 4,
        tipoSanguineo: "AB+",
      ),
      Funcionario(
        nome: "Roberto Lima",
        cpf: "555.555.555-55",
        rg: 9988776,
        dataNascimento: DateTime(1979, 7, 5),
        id: 5,
        cargo: "Técnico de Laboratório",
        salario: 2800.00,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema de Banco de Sangue"),
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: listaPessoas.length,
        itemBuilder: (context, index) {
          final pessoa = listaPessoas[index];

          //downcast (is)
          String detalhes = "";
          if (pessoa is Doador) {
            String status = pessoa.verificarElegibilidade()
                ? "Elegível"
                : "Inelegível (Idade)";
            String obs = pessoa.observacaoMedica ?? "Sem observações";
            detalhes =
                "Doador | Tipo: ${pessoa.tipoSanguineo} | Status: $status\nObs: $obs";
          } else if (pessoa is Funcionario) {
            detalhes =
                "Funcionário | Cargo: ${pessoa.cargo}\nSalário: R\$ ${pessoa.salario.toStringAsFixed(2)}";
          }

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: Icon(
                pessoa is Doador ? Icons.bloodtype : Icons.badge,
                color: pessoa is Doador ? Colors.red : Colors.blueGrey,
                size: 32,
              ),
              title: Text(
                pessoa.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("CPF: ${pessoa.cpf}\n$detalhes"),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
