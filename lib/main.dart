import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/list_provider.dart';
import 'package:to_do_app/theme.dart';
import 'package:to_do_app/ui/screens/home_screen.dart';
import 'package:to_do_app/ui/screens/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();//offline-local
  runApp(ChangeNotifierProvider(
    create: (context) => ListProvider(),
      child: MyApp()));
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
