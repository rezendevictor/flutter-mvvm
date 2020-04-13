import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';

class Toolbox {
  static double somador(String nome, List<ExpenseAddition> lista) {
    double resultado = 0;
    for (ExpenseAddition x in lista) {
      if (x.type == nome) {
        resultado += double.parse(x.value);
      }
    }
    return resultado;
  }

  static int select(String categor) {
    if (categor == "NECESSIDADES") {
      return 1;
    } else if (categor == "QUERERES") {
      return 2;
    } else {
      return 3;
    }
  }

  static List<ExpenseAddition> filter(
    List<ExpenseAddition> fullList,
    String filter,
  ) {
    List<ExpenseAddition> filtered = [];
    for (ExpenseAddition x in fullList) {
      if (x.type == filter) {
        filtered.add(x);
      }
    }
    return filtered;
  }
}
