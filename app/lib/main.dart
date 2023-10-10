import 'dart:convert';
import 'dart:io';

class Pessoa {
  String _nome = '';
  double _peso = 0.0;
  double _altura = 0.0;

  String getNome() {
    return _nome;
  }

  double getPeso() {
    return _peso;
  }

  double getAltura() {
    return _altura;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }
}

Pessoa pessoa = Pessoa();
bool validNome = false;
bool validPeso = false;
bool validAltura = false;
bool validRetorno = false;
bool valid = false;
String message = '';
void inicio() {
  print('Bem vindo!\nPara fazer o calculo vou te pedir seu nome, peso e altura');
  while (!valid) {
    while (!validNome) {
      lerPessoa();
    }
    while (!validPeso) {
      lerPeso();
    }
    while (!validAltura) {
      lerAltura();
    }
    valid = true;
    var calcImc = pessoa.getPeso() / (pessoa.getAltura() * pessoa.getAltura());
    selecionaOpcao(calcImc);
  }
}

void retorno(String value) {
  if (value == '1') {
    valid = false;
    validNome = false;
    validPeso = false;
    validAltura = false;
    validRetorno = false;
    inicio();
  } else if (value == '2') {
    print('Programa finalizado\nAté logo');
    valid = true;
    validRetorno = true;
  } else {
    print('Valor inválido');
    valid = false;
    validRetorno = false;
    end();
  }
}

void end() {
  print('Digite 1 para fazer novo cálculo:\nDigite 2 para sair:');
  var res = lerConsole();
  retorno(res);
}

void lerPessoa() {
  print('Digite seu nome: ');
  pessoa.setNome(lerConsole());
  if (pessoa._nome.isEmpty || pessoa._nome.contains('!@#\$%º¨&*()-_:;^~}]{[}/*+|?')) {
    print('Nome inválido');
    validNome = false;
  } else {
    validNome = true;
  }
}

void lerPeso() {
  print('Digite seu Peso: ');
  var peso = lerConsole();

  if (peso.isEmpty || peso == '0' || peso == '9' || peso.contains('!@#\$%º¨&*()-_:;^~}]{[}/*+|?') || peso.contains(RegExp(r'^[a-z]+$'))) {
    print('O peso deve ser informado no formato de exemplo: 80.4');
    validPeso = false;
  } else {
    pessoa.setPeso(double.parse(peso));
    validPeso = true;
  }
}

void lerAltura() {
  print('Digite sua Altura: ');
  var altura = lerConsole();

  if (altura.isEmpty || altura == '0' || altura == '9' || altura.contains('!@#\$%º¨&*()-_:;^~}]{[}/*+|?') || altura.contains(RegExp(r'^[a-z]+$'))) {
    print('A altura deve ser informada no formato de exemplo 1.78');
    validAltura = false;
  } else {
    pessoa.setAltura(double.parse(altura));
    validAltura = true;
  }
}

void selecionaOpcao(double value) {
  switch (value) {
    case < 16:
      printConsole(value, 'Magreza grave!');
      break;
    case 16:
      printConsole(value, 'Magreza moderada!');
      break;
    case >= 17 && < 18.5:
      printConsole(value, 'Magreza leve!');
      break;
    case >= 18.5 && < 25:
      printConsole(value, 'Saudável!');
      break;
    case >= 25 && < 30:
      printConsole(value, 'Sobrepeso!');
      break;
    case >= 30 && < 35:
      printConsole(value, 'Obesidade Grau I!');
      break;
    case >= 35 && < 40:
      printConsole(value, 'Obesidade Grau II (severa)!');
      break;
    case >= 40:
      printConsole(value, 'Obesidade Grau III (mórbida)!');
      break;
    default:
      print('Não foi possível calcular as medidas inseridas');
      end();
      break;
  }
}

String lerConsole() {
  var line = stdin.readLineSync(encoding: utf8)?.replaceAll(',', '.') ?? '';
  return line;
}

dynamic printConsole(double resultado, String classificacao) {
  message = '${pessoa._nome} seu IMC é: ${resultado.toStringAsFixed(2)} classificado como: $classificacao';
  return print(message);
}
