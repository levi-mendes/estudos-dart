void main() {
  var conta = ContaCorrente();
  conta.titular = 'Levi';
  conta.agencia = 3282;
  conta.conta = 301;
  conta.deposito(10000.0);

  /*print('Saldo = ${conta.getSaldo()}');
  print('Deposito = ${conta.deposito(500)}');
  print('Saque = ${conta.saque(200)}');
  print('Saldo = ${conta.getSaldo()}');*/

  print('Saldo conta Origem ( Antes ) = ${conta.getSaldo()}');

  var contaDestino = ContaCorrente();
  print('Saldo conta Destino ( Antes ) = ${contaDestino.getSaldo()}');
  conta.transferencia(35.0, contaDestino);
  print('Saldo conta Destino ( Depois ) = ${contaDestino.getSaldo()}');

  print('Saldo conta Origem ( Depois ) = ${conta.getSaldo()}');
}

class ContaCorrente {
  String titular;
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
      print('Saldo Insuficiente !');
      return false;
    }

    _saldo -= valor;
    contaDestino.deposito(valor);
    return true;
  }

  double getSaldo() => _saldo;

  double deposito(double valor) {
    _saldo += valor;
    return _saldo;
  }

  bool temLimite(double valor) => _saldo > valor;

  @override
  String toString() {
    return 'Titular $titular \nAgencia $agencia \nConta $conta \nSaldo $_saldo';
  }
}
