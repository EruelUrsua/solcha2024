import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solcha2024/nav.dart';
import 'package:solcha2024/profile.dart';
import 'package:solcha2024/users/signup.dart';
import 'package:solcha2024/users/startup.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyChEHzC8CQcnoZtfuHV5jBzuWfMWYTno_I",
          appId: "1:1023000700204:android:fc480b4a8486a8f7783889",
          messagingSenderId: "solcha2024",
          projectId: "solcha2024"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthLink',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: const Color(0xFF0079BD)),
      ),
      home:
          NavigationMenu(), //<------------------ change the class if you need to test
      // Welcome(),
      //Profile(),
      //     FlutterSplashScreen.fadeIn(
      //   backgroundColor: Colors.white,
      //   onInit: () {
      //     debugPrint("On Init");
      //   },
      //   onEnd: () {
      //     debugPrint("On End");
      //   },
      //   childWidget: SizedBox(
      //     height: 200,
      //     width: 200,
      //     child: Image.asset("assets/logo.png"),
      //   ),
      //   duration: const Duration(milliseconds: 1500),
      //   animationDuration: const Duration(milliseconds: 1000),
      //   onAnimationEnd: () => debugPrint("On Fade In End"),
      //   nextScreen: const NavigationMenu(),
      // ),
    );
  }
}
