import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solcha2024/toast.dart';
import 'package:solcha2024/users/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: const Color(0xFF8E8BE6), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          color: Colors.grey.shade800,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Should open something')));
          },
        ),
      ]),
      body: buildHomeBody(context),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }

  Widget buildHomeBody(BuildContext context) => Container(
        alignment: Alignment.center,
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
            child: const Center(
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
