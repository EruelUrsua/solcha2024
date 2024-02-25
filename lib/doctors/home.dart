import 'package:flutter/material.dart';
import 'package:solcha2024/custom_appbar_shape.dart';
import 'package:solcha2024/menu_drawer.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 80,
          title: Center(),
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
      body: ListView(children: [
        buildRoundAppBar(context),
        //buildHomeBody(context),
        buildAppointText(),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 10,
          color: Color(0xFFD2D2D2),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .12,
            width: MediaQuery.of(context).size.width * .40,
            decoration: BoxDecoration(
                color: Color(0xFF8E8BE6),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "       With",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  " Liannah",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  " 02/18/2024 8:00 AM",
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.check),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
            padding: EdgeInsets.all(1.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .12,
            width: MediaQuery.of(context).size.width * .10,
            decoration: BoxDecoration(
                color: Color(0xFF8E8BE6),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "       With",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  " Mike",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  " 02/25/2024 12:00 PM",
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.check),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        //SizedBox(height: 1),
        buildSchedText(),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 10,
          color: Color(0xFFD2D2D2),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .12,
            width: MediaQuery.of(context).size.width * .10,
            decoration: BoxDecoration(
                color: Color(0xFFB6B6B6),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "       With",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  " Angel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  " 03/20/2024 12:00 PM",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .12,
            width: MediaQuery.of(context).size.width * .10,
            decoration: BoxDecoration(
                color: Color(0xFFB6B6B6),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "       With",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  " Matthew",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  " 04/21/2024 12:00 PM",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ]),
      drawer: CustomDrawer(),
    );
  }
}

Widget buildRoundAppBar(BuildContext context) => Stack(children: <Widget>[
      ClipPath(
        clipper: CustomAppBarShape(),
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF8E8BE6),
          //color: Colors.transparent,
        ),
      ),
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
                    prefixIcon: Icon(color: Colors.grey.shade700, Icons.search),
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

Widget buildAppointText() => Container(
        child: Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 40.0),
        child: Text('Pending Appointment',
            style: TextStyle(
              color: Color(0xFF7775FC),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )),
      ),
    ));

Widget buildSchedText() => Container(
        child: Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 40.0),
        child: Text('Upcoming Schedule',
            style: TextStyle(
              color: Color(0xFF7775FC),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )),
      ),
    ));

Widget buildRowCategories() => Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF8E8BE6),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF8E8BE6),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
        ),
      ],
    );

Widget _buildContainer() {
  return Column(
    children: [
      _buildGrayContainer(),
      SizedBox(height: 20.0),
      _buildGrayContainer(),
      SizedBox(height: 20.0),
    ],
  );
}

Widget _buildPContainer() {
  return Column(
    children: [
      _buildPurpleContainer(),
      SizedBox(height: 20.0),
      _buildPurpleContainer(),
      SizedBox(height: 5.0),
    ],
  );
}

Widget _buildGrayContainer() {
  return Container(
    height: 100.0,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.grey.shade300,
    ),
  );
}

Widget _buildPurpleContainer() {
  return Container(
    height: 100.0,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xFF8E8BE6),
    ),
  );
}
