import 'package:flutter/material.dart';
import 'package:to_do_app/theme.dart';
import 'package:to_do_app/ui/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.light,
    initialRoute: HomeScreen.routeName,
      routes: {
      HomeScreen.routeName:(context) => HomeScreen(),
      },
    );
  }
}
