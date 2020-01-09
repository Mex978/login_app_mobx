import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app_mobx/store/login_controller.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginController = GetIt.I.get<LoginController>();

    Future.delayed(Duration(seconds: 2), () {
      print(_loginController.user);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  _loginController.user == null ? LoginScreen() : HomeScreen()));
    });

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Observer(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text(
              "Login App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
          ),
        );
      },
    );
  }
}
