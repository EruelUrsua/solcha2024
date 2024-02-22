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
      body: Column(children: [
        buildRoundAppBar(context),
        //buildHomeBody(context),
        buildCategoriesText(),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 10,
          color: Color(0xFFD2D2D2),
        ),
        SizedBox(height: 10.0),
        _buildContainer(),
        SizedBox(height: 10.0),
        buildRowCategories(),
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

Widget buildCategoriesText() => Container(
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
