import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solcha2024/toast.dart';
import 'package:solcha2024/users/login.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          buildMenuItems(context),
        ]),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            title: const Text('Log out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              showToast(message: "Successfully signed out");
            },
          ),
        ],
      );
}
