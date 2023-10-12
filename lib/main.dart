import 'package:flutter/material.dart';
import 'package:to_do_app/theme.dart';
import 'package:to_do_app/ui/screens/home/home_screen.dart';
import 'package:to_do_app/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      initialRoute: SplashScreen.routeName,
      routes: {
       SplashScreen.routeName:(context) => SplashScreen(),
       HomeScreen.routeName:(context) => HomeScreen(),
      },
    );
  }
}
