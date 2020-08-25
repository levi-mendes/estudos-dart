void main() {
  var conta = ContaCorrente();
  conta.titular = 'Levi';
  conta.agencia = 3282;
  conta.conta = 301;

  print('Saldo = ${conta.getSaldo()}');
  print('Deposito = ${conta.deposito(500)}');
  print('Saque = ${conta.saque(200)}');
  print('Saldo = ${conta.getSaldo()}');
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
    //print('Valor sacado = $valor');
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
