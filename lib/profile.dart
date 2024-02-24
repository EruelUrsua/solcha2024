import 'package:flutter/material.dart';
import 'package:solcha2024/menu_drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 80,
          backgroundColor: const Color(0xFF8E8BE6),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              iconSize: 30,
              //color: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Should open something')));
              },
            ),
          ]),
      backgroundColor: Color(0xFF8E8BE6),
      drawer: CustomDrawer(),
    );
  }

  Widget buildColorBackdrop() => Container(
        //width: double.infinity,
        //height: 300.0,
        decoration: const BoxDecoration(
            color: Color(0xFF484F79),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(15),
              bottomEnd: Radius.circular(15),
            )),
        //child: const Placeholder(color: Color.fromARGB(255, 44, 42, 66)),
        child: buildProfileImage(),
      );

  Widget buildProfileImage() => Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(40.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          radius: 30,
        ),
      );
}
