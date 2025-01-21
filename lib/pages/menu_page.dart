import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/components/button.dart';
import 'package:hotel_management/components/hotel_tile.dart';
import 'package:hotel_management/models/hotels.dart';
import 'package:hotel_management/pages/hotel_details_page.dart';
import 'package:hotel_management/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToHotelDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HotelDetailsPage(hotel: stays[index]),
      ),
    );
  }

  List stays = [
    Hotels(
      name: 'Soaltee',
      location: 'Bhaktapur',
      imagePath: 'lib/images/sunbed.png',
      rating: '3.9',
    ),
    Hotels(
      name: 'Everest',
      location: 'Naxal',
      imagePath: 'lib/images/home.png',
      rating: '4.1',
    ),
    Hotels(
      name: 'Mariot',
      location: 'Baneshwor',
      imagePath: 'lib/images/hotel.png',
      rating: '3.9',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Text('Dine', style: TextStyle(color: Colors.grey[900])),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promo Section
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get 32% Promo.',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: screenWidth * 0.05,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          MyButton(text: 'Redeem Now', onTap: () {}),
                        ],
                      ),
                    ),
                    Image.asset(
                      'lib/images/bathrobe.png',
                      height: screenHeight * 0.15,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search for resturants',
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // Popular Stays Section
              Text(
                'Popular Resturants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: screenWidth * 0.045,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                height: screenHeight * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stays.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.04),
                    child: HotelTile(
                      onTap: () => navigateToHotelDetails(index),
                      hotels: stays[index],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // Footer Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Row(
                  children: [
                    Image.asset('lib/images/london-bridge.png',
                        height: screenHeight * 0.08),
                    SizedBox(width: screenWidth * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'London Bridge',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                        Text(
                          'United Kingdom',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.favorite_outline, color: Colors.grey, size: 28),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
