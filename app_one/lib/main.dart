import 'package:app_one/screens/home_page.dart';
import 'package:app_one/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.teal),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       // routes: {
  //       //   '/': (context) => const HomePage(),
  //       //   //'/details': (context) => DetailScreen(),
  //       // },
  //       );
  // }
}
