import 'package:estudosdartalura/ContaCorrente.dart';
import 'package:estudosdartalura/Cliente.dart';

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
