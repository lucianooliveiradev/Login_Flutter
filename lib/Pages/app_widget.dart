import 'package:flutter/material.dart';
import 'package:ola_mundo/Pages/home_page.dart';
import 'package:ola_mundo/Pages/login_page.dart';
import 'package:ola_mundo/app_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: AppController.instance.isDartTheme
                  ? Brightness.dark
                  : Brightness.light,
              // brightness: Brightness.light,
            ),
            home: LoginPage(),
            initialRoute: '/',
            routes: {
              '/login': (context) => LoginPage(),
              '/home': (context) => HomePage()
            },
          );
        });
  }
}
