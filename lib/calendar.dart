import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleCalendarPage(),
    );
  }
}

class SimpleCalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calendar'),
      ),
      body: Center(
        child: Text('Calendar Page'),
      ),
    );
  }
}