import 'package:flutter/material.dart';
import 'package:solcha2024/menu_drawer.dart';
import 'package:solcha2024/user_language_dropdown.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

// String getSelectedItem() {
//   String item = LanguageDropdown().selectedItem;
//   return item;
// }

class _ProfileState extends State<Profile> {
  //List<String> langs = ;

  final List<Widget> langFields = [];

  final _key = GlobalKey();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     addField();
  //   });
  // }

  // addField() {
  //   setState(() {
  //     langFields.add(buildAddedLanguageField(getSelectedItem()));
  //   });
  // }

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
          buildWhiteSpace(context, contentBoxHeight),
          Positioned(
            bottom: contentBoxHeight - userBoxHeight / 2,
            child: buildUserDetailsBox(context, userBoxHeight),
          ),
        ],
      ),
    );
  }

  // row with 'Languages' text
  Widget buildLanguagesRow(BuildContext context) {
    return Row(
      children: [
        // Container(
        //   alignment: Alignment.centerLeft,
        //   child: Row(
        //     children: <Widget>[
        //       Text(
        //         'Languages',
        //         style: TextStyle(
        //           color: const Color(0xFF8E8BE6),
        //           fontSize: 17.0,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        //buildAddLangButton(),
        LanguageDropdown(),
      ],
    );
  }

  // the + button next to languages, in Languages row
  Widget buildAddLangButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      // child: LanguageDropdown(
      //     languages: ['Tagalog', 'English', 'Cebuano', 'Bisaya', 'Ilocano'],
      //     onChange: (index) {}),
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.025,
        width: MediaQuery.of(context).size.width * 0.05,
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.add),
          iconSize: 18.0,
          onPressed: () {},
        ),
      ),
    );
  }

  // the white content background
  Widget buildWhiteSpace(BuildContext context, double contentHeight) => Align(
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
                  child: buildLanguagesRow(context),
                ),
                // Column(key: _key, children: [
                //   for (int i = 0; i < langFields.length; i++)
                //     buildLangFields(context),
                // ]),
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

  // Row of inputted language fields
  Widget buildLangFields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Row(
        children: [
          buildLanguageField(),
          buildAddedLanguageField('English'),
        ],
      ),
    );
  }

  // widget for 1 language field
  Widget buildLanguageField() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.025,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Ilocano',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.close, size: 16.0, weight: 3.0),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget buildAddedLanguageField(String lang) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.025,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('$lang',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500)),
            IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.close, size: 16.0, weight: 3.0),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

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
}
