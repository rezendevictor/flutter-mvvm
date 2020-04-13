enum ExpTyp { NEEDS, WANTS, SAVINGS }

class ExpenseData {
  final double valor;
  final int type;

  ExpenseData(this.valor, this.type);

  void create(String svalor,String stype){
    double ivalor = double.tryParse(svalor);
    int itype = int.tryParse(stype);

    ExpenseData(ivalor, itype);

  }
}
