import 'package:mobx/mobx.dart';
import 'package:mvvm/model/ExpenseModel.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore  with Store{
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "https://picsum.photos/200/200";

  @observable
  String token = "";

  @observable
  final List<ExpenseAddition> ExpenseData = [];

  void addExpense(ExpenseAddition novo){
    this.ExpenseData.add(novo);
  }

  List<ExpenseAddition> voltaLista(){
    List<ExpenseAddition> Expense = this.ExpenseData;
    return Expense;
  }


  @action
  void setUser(
    String pName,
    String pEmail,
    String pPicture,
    String pToken,
  ) {
    name = pName;
    picture = pPicture;
    email = pEmail;
    token = pToken;
  }





}
