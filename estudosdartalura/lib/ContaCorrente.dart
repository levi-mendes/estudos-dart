import 'Cliente.dart';

class ContaCorrente {
  ContaCorrente(this._agencia, this.conta) {
    totalDeContas++;
  }

  static int totalDeContas = 0;

  Cliente titular;
  int _agencia = 145;
  int get agencia => _agencia;
  set agencia(int novaAgencia) => _agencia = novaAgencia;

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
