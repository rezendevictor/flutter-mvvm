import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
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
  final List<ExpenseAddition> expenseData = [];

  FirebaseUser user;

  void setFirebaseUser(FirebaseUser user2){
    this.user = user2;
  }

  void addExpense(ExpenseAddition novo){
    this.expenseData.add(novo);
  }

  List<ExpenseAddition> voltaLista(){
    List<ExpenseAddition> expense = this.expenseData;
    return expense;
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
