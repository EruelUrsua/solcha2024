import 'package:flutter/material.dart';
import 'package:solcha2024/doctors/home.dart';

class DoctorNavigationMenu extends StatefulWidget {
  const DoctorNavigationMenu({Key? key}) : super(key: key);

  @override
  State<DoctorNavigationMenu> createState() => _DoctorNavigationMenuState();
}

class _DoctorNavigationMenuState extends State<DoctorNavigationMenu> {
  int _currentIndex = 0;
  List<Widget> body = const [
    DoctorHome(),
    Icon(Icons.bookmark),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: body[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Book',
              icon: Icon(Icons.bookmark),
            ),
          ],
        ));
  }
}
