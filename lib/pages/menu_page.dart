import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/components/button.dart';
import 'package:hotel_management/components/hotel_tile.dart';
import 'package:hotel_management/models/hotels.dart';
import 'package:hotel_management/pages/hotel_details_page.dart';

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
      imagePath:
          'https://q-xx.bstatic.com/xdata/images/hotel/max500/252046750.jpg?k=1c956f6528232f65d2b1b3f948032a3e9f86e9b2e808c122709617c88860b474&o=',
      rating: '3.9',
    ),
    Hotels(
      name: 'Everest',
      location: 'Naxal',
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0MOycgRpuxxyenVkeogIzjPuEu55bCHY-BQ&s',
      rating: '4.1',
    ),
    Hotels(
      name: 'Mariot',
      location: 'Baneshwor',
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy_naAiqB4RTb_YAuJZFUVB-QH5ZVrrQmYfg&s',
      rating: '3.9',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Light Beige
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight:
            MediaQuery.of(context).size.height * 0.05, // 7% of screen height
        leading:
            Icon(Icons.menu, color: const Color(0xFF333333)), // Charcoal Gray
        title: Text(
          'Dine Now',
          style: TextStyle(
            color: const Color(0xFF333333), // Charcoal Gray
            fontSize: MediaQuery.of(context).size.height *
                0.025, // 2.5% of screen height
          ),
        ),
        centerTitle: true, // This centers the title
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Add right padding
            child: IconButton(
              icon: Icon(Icons.business,
                  color: const Color(0xFF333333)), // Hotel owner icon
              onPressed: () {
                // Add functionality for the hotel owner icon
                Navigator.pushNamed(context, '/hiddendrawer');
              },
            ),
          ),
        ],
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
                  color: const Color(0xFF2E3A59), // Soft Navy Blue
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
                  color: const Color(0xFF333333), // Charcoal Gray
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
                  color: const Color(0xFF777777)
                      .withOpacity(0.1), // Soft Gray with opacity
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
                            color: const Color(0xFF333333), // Charcoal Gray
                          ),
                        ),
                        Text(
                          'United Kingdom',
                          style: TextStyle(
                              color: const Color(0xFF777777)), // Soft Gray
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.favorite_outline,
                        color: const Color(0xFF777777), size: 28), // Soft Gray
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
