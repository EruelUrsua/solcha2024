import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solcha2024/toast.dart';
import 'package:solcha2024/users/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heading'),
      ),
      body: buildHomeBody(context),
    );
  }

  Widget buildHomeBody(BuildContext context) => Container(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
            showToast(message: "Successfully signed out");
          },
          child: Container(
            height: 45,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Sign out",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      );
}
