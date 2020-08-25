void main() {
  var conta = ContaCorrente();
  conta.titular = 'Levi';

  print(conta.toString());
}

class ContaCorrente {
  String titular;
  int agencia;
  int conta;
  double saldo;

  @override
  String toString() {
    return 'Titular $titular \nAgencia $agencia \nConta $conta \nSaldo $saldo';
  }
} //le vi
