import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  Map<String, dynamic> user;

  @observable
  String email;

  @observable
  String password;

  String validateEmail() {
    if (email == null)
      return null;
    else if (email.isEmpty)
      return "Esse campo é obrigatório.";
    else if (email.contains("@") && email.length >= 11 && email.contains("."))
      return null;
    else
      return "E-mail inválido.";
  }

  String validatePassword() {
    if (password == null)
      return null;
    else if (password.isEmpty)
      return "Esse campo é obrigatório.";
    else if (password.length > 8)
      return null;
    else
      return "A senha deve possuir pelo menos 8 caracteres.";
  }

  @computed
  get allValid =>
      email != null &&
      password != null &&
      validateEmail() == null &&
      validatePassword() == null;

  @action
  changeEmail(String value) {
    email = value;
  }

  @action
  changePassword(String value) {
    password = value;
  }
}
