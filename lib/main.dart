import 'package:flutter/material.dart';
import 'package:solcha2024/nav.dart';
import 'package:solcha2024/users/startup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'HealthLink',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: const Color(0xFF0079BD)),
      ),
      home:
          //NavigationMenu(), //<------------------ change the class if you need to test
          Welcome(),
    );
  }
}
