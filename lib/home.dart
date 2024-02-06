import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:solcha2024/custom_appbar_shape.dart';
import 'package:solcha2024/toast.dart';
import 'package:solcha2024/users/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 80,
          title: Center(
              child: Text(
            "Hello username!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          )),
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
        _buildCarousel(),
        buildHomeBody(context),
      ]),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
    );
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

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      carouselController: _carouselController,
      options: CarouselOptions(
          height: 170.0,
          enlargeCenterPage: true,
          autoPlay: false,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          // autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayInterval: Duration(seconds: 5),
          viewportFraction: 0.60,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          }),
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        final opacity = (_currentIndex == index) ? 1.0 : 0.5;
        return Opacity(
          opacity: opacity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              'assets/imageHome$index.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget buildHomeBody(BuildContext context) => Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
            showToast(message: "Successfully signed out");
          },
          child: Container(
            height: 45,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                "Sign out",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      );
}
