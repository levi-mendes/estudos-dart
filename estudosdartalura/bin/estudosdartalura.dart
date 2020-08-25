void main() {
  /*var conta = ContaCorrente();
  conta.titular = 'Levi';
  conta.agencia = 3282;
  conta.conta = 301;
  //conta.deposito(10000.0);

  print('Saldo = ${conta.getSaldo()}');
  print('Deposito = ${conta.deposito(500)}');
  print('Saque = ${conta.saque(200)}');
  print('Saldo = ${conta.getSaldo()}');*/

  var levi = Cliente();
  levi.nome = 'Levi Mendes';
  levi.cpf = '123.123.123.12';
  levi.profissao = 'Programador';

  var rafaela = Cliente();
  rafaela.nome = 'Rafaela Mendes';
  rafaela.cpf = '456.456.456.45';
  rafaela.profissao = 'Cabelereira';

  var contaLevi = ContaCorrente();
  contaLevi.titular = levi;

  var contaRafaela = ContaCorrente();
  contaRafaela.titular = rafaela;

  print('Saldo conta Origem ( Antes ) = ${contaLevi.getSaldo()}');
  print('Saldo conta Destino ( Antes ) = ${contaRafaela.getSaldo()}');
  contaLevi.transferencia(61.0, contaRafaela);
  print('Saldo conta Destino ( Depois ) = ${contaRafaela.getSaldo()}');
  print('Saldo conta Origem ( Depois ) = ${contaLevi.getSaldo()}');
}

class ContaCorrente {
  Cliente titular;
  int agencia;
  int conta;
  double _saldo = 50.0;

  bool saque(double valor) {
    if (!temLimite(valor)) {
      print('Limite insuficiente');
      return false;
    }

    _saldo -= valor;
    return true;
  }

  bool transferencia(double valor, ContaCorrente contaDestino) {
    if (!temLimite(valor)) {
      print('\n---------- Saldo Insuficiente !!!!! -----------\n');
      return false;
    }

    _saldo -= valor;
    contaDestino.deposito(valor);
    return true;
  }

  double valorChequeEspecial() => -10.0;

  double getSaldo() => _saldo;

  double deposito(double valor) {
    _saldo += valor;
    return _saldo;
  }

  bool temLimite(double valor) => _saldo >= (valor + valorChequeEspecial());

  @override
  String toString() =>
      'Titular $titular \nAgencia $agencia \nConta $conta \nSaldo $_saldo';
}

class Cliente {
  String nome;
  String cpf;
  String profissao;
}
