import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solcha2024/nav.dart';
import 'package:solcha2024/profile.dart';
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
          buildHeader(context),
          buildMenuItems(context),
        ]),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 24.0, top: 50.0, bottom: 20.0),
        child: Row(
          children: [
            Icon(Icons.menu, size: 35, color: Colors.grey.shade900),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: const Color(0xFF8E8BE6),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        //padding: const EdgeInsets.only(left: 40.0),
        child: Wrap(
          runSpacing: 0.2,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListTile(
                title: const Text('Profile', style: TextStyle(fontSize: 15.0)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationMenu()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListTile(
                title: const Text('Files & Prescriptions',
                    style: TextStyle(fontSize: 15.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Divider(
                color: Color(0xFFD2D2D2),
                thickness: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListTile(
                title: const Text('Ratings & Reviews',
                    style: TextStyle(fontSize: 15.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListTile(
                title: const Text('Appointment History',
                    style: TextStyle(fontSize: 15.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: const Divider(
                color: Color(0xFFD2D2D2),
                thickness: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListTile(
                title: const Text('Settings & Privacy',
                    style: TextStyle(fontSize: 15.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListTile(
                title: const Text('Help & Support',
                    style: TextStyle(fontSize: 15.0)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 40.0, right: 15.0),
              child: const Divider(
                color: Color(0xFFD2D2D2),
                thickness: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: ListTile(
                title: const Text('Log out',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                  showToast(message: "Successfully signed out");
                },
              ),
            ),
          ],
        ),
      );
}
