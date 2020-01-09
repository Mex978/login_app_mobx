import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app_mobx/store/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final _loginController = GetIt.I.get<LoginController>();
  final _emailNode = FocusNode();
  final _passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return _textFiled(
                        context: context,
                        label: "E-mail",
                        errorText: _loginController.validateEmail());
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Observer(
                  builder: (_) {
                    return _textFiled(
                        context: context,
                        label: "Senha",
                        errorText: _loginController.validatePassword());
                  },
                ),
                SizedBox(
                  height: 70,
                ),
                Observer(
                  builder: (_) {
                    return RaisedButton(
                      onPressed: _loginController.allValid ? () {} : null,
                      elevation: 0,
                      disabledColor: Color.fromRGBO(0, 150, 0, 0.4),
                      disabledTextColor: Colors.white,
                      child: Text("ENTRAR"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _textFiled({@required context, @required label, errorText}) {
    final bool isEmail = label == "E-mail";

    return TextField(
      obscureText: !isEmail,
      focusNode: isEmail ? _emailNode : _passNode,
      keyboardType: isEmail ? TextInputType.emailAddress : null,
      textInputAction: isEmail ? TextInputAction.next : TextInputAction.done,
      onChanged: (value) => isEmail
          ? _loginController.changeEmail(value)
          : _loginController.changePassword(value),
      onSubmitted: (_) =>
          isEmail ? FocusScope.of(context).requestFocus(_passNode) : () {},
      decoration: InputDecoration(
          errorText: errorText,
          labelText: label,
          hintText: isEmail ? "Digite seu e-mail" : "Digite sua senha"),
    );
  }
}
