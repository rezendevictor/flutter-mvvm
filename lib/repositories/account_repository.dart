import 'package:mvvm/model/UserModel.dart';
import 'package:mvvm/viewmodel/singup_viewmodel.dart';

class AccountRepository{

  Future<UserModel> createAccount(SingupViewModel model) async {
    await Future.delayed(new Duration(seconds: 2));
    return new UserModel(
        id: "1",
        name: "Teste",
        email: "email@provedor.com",
        picture: "https://picsum.photos/200/300https://picsum.photos/200/300",
        token: "null"
    );
  }
}