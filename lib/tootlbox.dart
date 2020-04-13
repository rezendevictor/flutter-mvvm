import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
class toolbox {

  static double somador(String nome, List<ExpenseAddition> lista) {
    double resultado = 0;
    for (ExpenseAddition x in lista) {
      if (x.type == nome) {
        resultado += double.parse(x.value);
      }
    }
    return resultado;
  }


}
