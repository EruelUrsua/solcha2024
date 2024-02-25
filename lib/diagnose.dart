import 'package:flutter/material.dart';

import 'booking.dart';
import 'menu_drawer.dart';

class Diagnose extends StatefulWidget {
  const Diagnose({Key? key}) : super(key: key);

  @override
  _DiagnoseState createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            iconSize: 30,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Should open something')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildRoundAppBar(context),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Common Conditions',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF7775FC)),
              ),
            ),
            _buildConditionGrid(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Other Categories',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF7775FC)),
              ),
            ),
            _buildOtherCategoriesGrid(),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }

  Widget _buildConditionGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            _navigateToBookingPage(context);
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(
              'assets/${index + 1}.png', // Loads images 1.png to 4.png
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildOtherCategoriesGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            _navigateToBookingPage(context);
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(
              'assets/${index + 5}.png', // Loads images 5.png to 8.png
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }

  void _navigateToBookingPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Booking()),
    );
  }
}

Widget buildRoundAppBar(BuildContext context) => Stack(children: <Widget>[
  // search bar
  Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .04,
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
                Icon(color: Colors.grey.shade700, Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Color(0xFF8E8BE6)),
                )),
            textAlignVertical: TextAlignVertical(y: -0.5),
          ),
        ),
      ),
    ),
  ),
]);