import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solcha2024/custom_appbar_shape.dart';
import 'package:solcha2024/toast.dart';
import 'package:solcha2024/users/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 130,
          title: Center(
              child: Text(
            "Hello username!",
            style: TextStyle(
              color: Color(0xFF392C82),
              fontSize: 17,
            ),
          )),
          backgroundColor: const Color(0xFFdcdcf4),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              iconSize: 30,
              color: Colors.grey.shade900,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Should open something')));
              },
            ),
          ]),
      body: Column(children: [
        buildRoundAppBar(context),
        buildHomeBody(context),
      ]),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget buildRoundAppBar(BuildContext context) => Stack(children: <Widget>[
        ClipPath(
          clipper: CustomAppBarShape(),
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFdcdcf4),
            //color: Colors.transparent,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width * .90,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Search",
                        prefixIcon:
                            Icon(color: Colors.grey.shade600, Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Color(0xFF8E8BE6)),
                        ))),
              ),
            ),
          ),
        ),
      ]);

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
