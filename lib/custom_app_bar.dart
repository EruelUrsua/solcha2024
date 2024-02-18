import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onMenuPressed;
  final Function() onNotificationPressed;

  const CustomAppBar({
    Key? key,
    required this.onMenuPressed,
    required this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100,
      decoration: BoxDecoration(
        color: Color(0xFF8E8BE6), // Background color violet
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), // Rounded bottom-left corner
          bottomRight: Radius.circular(20), // Rounded bottom-right corner
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the app bar's shadow
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: onMenuPressed,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: onNotificationPressed,
            iconSize: 30,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
