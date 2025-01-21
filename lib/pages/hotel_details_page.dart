import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/components/roomtiles.dart';
import 'package:hotel_management/models/activities.dart';
import 'package:hotel_management/models/rooms.dart';
import 'package:hotel_management/models/services.dart';
import 'package:hotel_management/themes/colors.dart';
import '../models/hotels.dart';

class HotelDetailsPage extends StatefulWidget {
  final Hotels hotel;
  const HotelDetailsPage({super.key, required this.hotel});

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  List suites = [
    Rooms(
        name: 'Bunk',
        price: 'Rs 1000',
        imagePath: 'lib/images/bunk-bed.png',
        rating: '3.9'),
    Rooms(
        name: 'Single',
        price: 'Rs 2000',
        imagePath: 'lib/images/bedroom.png',
        rating: '4.1'),
    Rooms(
        name: 'Balcony',
        price: 'Rs 3000',
        imagePath: 'lib/images/balcony.png',
        rating: '3.9'),
  ];

  List service = [
    Services(icon: Icon(Icons.pool), name: 'Pool'),
    Services(icon: Icon(Icons.wifi), name: 'Wifi'),
    Services(icon: Icon(Icons.ac_unit), name: 'AC'),
  ];
  List activities = [
    Activities(
        name: 'Explore More',
        description: 'Visit our Website',
        icon: Icon(Icons.web)),
    Activities(
        name: 'Visit us',
        description: 'Visit our hotels',
        icon: Icon(Icons.location_city)),
    Activities(
        name: 'Contact us',
        description: 'Call/ email us',
        icon: Icon(Icons.contact_mail)),
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
        foregroundColor: Colors.grey[900],
        title: Text(
          widget.hotel.name,
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    widget.hotel.imagePath,
                    width: double.infinity,
                    height: screenHeight * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.03,
                  left: screenWidth * 0.05,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      widget.hotel.location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'Available Suites',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: screenWidth * 0.06,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              height: screenHeight * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: suites.length,
                itemBuilder: (context, index) => RoomTile(
                  rooms: suites[index],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'Available Services',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: screenWidth * 0.06,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              height: screenHeight * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: service.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: primaryColor,
                      elevation: 4,
                      child: Container(
                        width: screenWidth * 0.35,
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              service[index].icon.icon,
                              size: screenWidth * 0.1,
                              color: Colors.white,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              service[index].name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'Activities',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: screenWidth * 0.06,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.01,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        activities[index].icon.icon,
                        size: screenWidth * 0.1,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        activities[index].name,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        activities[index].description,
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: screenWidth * 0.04,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Handle activity details
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
