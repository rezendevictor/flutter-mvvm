enum ExpTyp { NEEDS, WANTS, SAVINGS }

class ExpenseData {
  final double valor;
  final int type;

  ExpenseData(this.valor, this.type);

  void create(String svalor,String stype){
    double Ivalor = double.tryParse(svalor);
    int Itype = int.tryParse(stype);

    ExpenseData(Ivalor, Itype);

  }
}
