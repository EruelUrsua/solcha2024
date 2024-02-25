import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'booknow.dart';
import 'custom_app_bar.dart';
import 'custom_appbar_shape.dart';
import 'doctors/home.dart';
import 'menu_drawer.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

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
      body: Padding(
        padding: const EdgeInsets.all(12.0), // Add padding here
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRoundAppBar(context),
              SizedBox(height: 20),
              Text(
                'Suggested doctors',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7775FC),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              _buildCarousel(),
              SizedBox(height: 10),
              Text(
                'Nearby searches',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7775FC),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10.0),
              _buildContainer(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider.builder(
      carouselController: _carouselController,
      options: CarouselOptions(
          height: 300.0,
          enlargeCenterPage: true,
          autoPlay: true,
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
              'assets/image$index.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildContainer() {
    return Column(
      children: [
        _buildDoctorItem(
          image: 'assets/image0.png',
          name: 'Dr. John Doe',
          title: 'FPCC,MD',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookNow()),
            );
          },
        ),
        SizedBox(height: 20.0),
        _buildDoctorItem(
          image: 'assets/image1.png',
          name: 'Dr. Jane Smith',
          title: 'DDS',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookNow()),
            );
          },
        ),
        SizedBox(height: 20.0),
        _buildDoctorItem(
          image: 'assets/image2.png',
          name: 'Dr. David Brown',
          title: 'DO',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookNow()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDoctorItem(
      {required String image,
      required String name,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white, // Change background color to white
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Specify shadow color
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(image),
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Center(
        child: Text('Doctor Details Page'),
      ),
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
