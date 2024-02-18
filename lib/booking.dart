import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'custom_app_bar.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onMenuPressed: () {
          // Handle menu button pressed
        },
        onNotificationPressed: () {
          // Handle notification button pressed
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Should open something')));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 10),
              Text(
                'Suggested doctors',
                style: TextStyle(
                  fontSize: 18,
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7775FC),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10.0),
              _buildContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.transparent, // Set the color to transparent
      elevation: 4, // Add a little shadow
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xFF7775FC), width: 1.5), // Add a violet border
          color: Colors.white, // Change color to white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey, // Change text color to grey
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.grey), // Change hint text color to grey
              icon: Icon(Icons.search, color: Colors.grey), // Change search icon color to grey
            ),
          ),
        ),
      ),
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
        _buildGrayContainer(),
        SizedBox(height: 20.0),
        _buildGrayContainer(),
        SizedBox(height: 20.0),
        _buildGrayContainer(),
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
}
