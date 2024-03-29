import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';

import 'package:solcha2024/users/login.dart';
import 'package:solcha2024/users/signup.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Are you a :'),
            SizedBox(
              height: 40,
              child: ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  const [const Color(0xff8E8BE6)],
                  const [const Color(0xff8E8BE6)]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: 1,
                totalSwitches: 2,
                labels: ['Doctor', 'Patient'],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text('Confirm'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
