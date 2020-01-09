import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app_mobx/screens/splash_screen.dart';
import 'package:login_app_mobx/store/login_controller.dart';

void main() {
  GetIt.I.registerSingleton(LoginController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: ThemeData(
            cursorColor: Colors.green,
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
            primaryColor: Colors.green,
            textTheme: TextTheme(
                body1:
                    TextStyle(fontSize: 14, decoration: TextDecoration.none)),
            buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                buttonColor: Colors.green,
                height: 45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                minWidth: 2000)),
      ),
    );
  }
}
