import 'package:mvvm/model/UserModel.dart';
import 'package:mvvm/repositories/account_repository.dart';
import 'package:mvvm/viewmodel/singup_viewmodel.dart';

class LoginControler {
  AccountRepository repository;
  LoginControler(){
    repository = new AccountRepository();
  }

  Future<UserModel> create(SingupViewModel model) async {
    var user  = await repository.createAccount(model);
    return user;

  }
}
