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
    double contentBoxHeight = MediaQuery.of(context).size.height * .70;
    double userBoxHeight = MediaQuery.of(context).size.height * .15;

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
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Align(
          //   //alignment: FractionalOffset.bottomCenter,
          //   // child: Container(
          //   //   height: contentBoxHeight,
          //   //   decoration: BoxDecoration(
          //   //       color: Colors.white,
          //   //       borderRadius: BorderRadiusDirectional.only(
          //   //         topStart: Radius.circular(44),
          //   //         topEnd: Radius.circular(44),
          //   //       )),
          //   // ),
          //   child: buildWhiteSpace(context, contentBoxHeight),
          // ),
          buildWhiteSpace(context, contentBoxHeight, userBoxHeight),
          Positioned(
            bottom: contentBoxHeight - userBoxHeight / 2,
            child: buildUserDetailsBox(context, userBoxHeight),
          ),
        ],
      ),
    );
  }

  Widget buildLangFields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.025,
            width: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: <Widget>[
                Text('Ilocano',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
                Icon(
                  Icons.close,
                  size: 16.0,
                  weight: 3.0,
                )
              ],
            ),
            // child: TextField(
            //   expands: false,
            //   decoration: InputDecoration(
            //     suffixIcon: Icon(
            //       Icons.close,
            //       size: 15.0,
            //     ),
            //     labelText: 'Ilocano',
            //     labelStyle:
            //         TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
            //     filled: true,
            //     fillColor: Color(0xFFD9D9D9),
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(30),
            //         borderSide: BorderSide(width: 0, style: BorderStyle.none)),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }

  Widget buildWhiteSpace(
          BuildContext context, double contentHeight, double userHeight) =>
      Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          height: contentHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(44),
                topEnd: Radius.circular(44),
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, left: 40.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Languages',
                          style: TextStyle(
                            color: const Color(0xFF8E8BE6),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                buildLangFields(context),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 40.0,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Prescriptions: '),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .30,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 40.0,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Files/Documents: '),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .10,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .10,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .10,
                    width: MediaQuery.of(context).size.width * .85,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildUserDetailsBox(BuildContext context, double boxHeight) {
    //userBoxHeight = MediaQuery.of(context).size.height * .15;

    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        height: boxHeight,
        width: MediaQuery.of(context).size.width * .65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                child: Text('Juan Dela Cruz',
                    style: TextStyle(fontWeight: FontWeight.w500))),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30.0, top: 5.0, bottom: 5.0),
              child: Text('Age: 29    Location: Quezon City'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30.0, top: 5.0, bottom: 5.0),
              child: Text('Sex: Male    Joined: Jan 2024'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildColorBackdrop() => Container(
  //       //width: double.infinity,
  //       //height: 300.0,
  //       decoration: const BoxDecoration(
  //           color: Color(0xFF484F79),
  //           borderRadius: BorderRadiusDirectional.only(
  //             bottomStart: Radius.circular(15),
  //             bottomEnd: Radius.circular(15),
  //           )),
  //       //child: const Placeholder(color: Color.fromARGB(255, 44, 42, 66)),
  //       child: buildProfileImage(),
  //     );

  // Widget buildProfileImage() => Container(
  //       alignment: Alignment.bottomLeft,
  //       padding: const EdgeInsets.all(40.0),
  //       child: CircleAvatar(
  //         backgroundColor: Colors.grey.shade300,
  //         radius: 30,
  //       ),
  //     );
}
