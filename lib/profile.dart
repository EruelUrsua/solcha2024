import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: buildColorBackdrop(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 30, left: 20, bottom: 30, right: 20),
              //child: Placeholder(),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFB9B9B9),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 15.0, left: 20, bottom: 5, right: 20),
              //child: Placeholder(),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 20, bottom: 20, right: 20),
              //child: Placeholder(),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          // This part below seems the wrong way to do it but I will settle for this for now
          Expanded(
            flex: 1,
            //child: Placeholder(),
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
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
