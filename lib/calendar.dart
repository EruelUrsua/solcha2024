import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'doctors/home.dart';
import 'menu_drawer.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedTimeSlot;

  // List of time slots
  List<String> _timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E8BE6),
        elevation: 0,
        leading: IconButton(
          color: Colors.white,
          iconSize: 30,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Book an Appointment',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding here
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2022, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      _selectedTimeSlot = null; // Reset selected time slot when new day is selected
                    });
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Select a Time Slot:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: _timeSlots.map((timeSlot) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedTimeSlot = timeSlot;
                          });
                        },
                        child: Text(timeSlot),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                if (_selectedDay != null && _selectedTimeSlot != null) ...[
                  Text(
                    'Selected Date: ${_selectedDay!.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Selected Time: $_selectedTimeSlot',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedTimeSlot = null;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300, // Set background color for cancel button
                          ),
                          child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Appointment Summary'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Appointment with Dr. John Doe",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text('${_selectedDay!.toLocal().toString().split(' ')[0]}' + ' at ' + '$_selectedTimeSlot' + ' !' ,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7775FC), // Set background color for cancel button
                          ),
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
