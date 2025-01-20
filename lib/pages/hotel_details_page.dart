import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/components/roomtiles.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
        title: Text(
          widget.hotel.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      widget.hotel.location,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Available Suites',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 30,
                  )),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: suites.length,
                itemBuilder: (context, index) => RoomTile(
                  rooms: suites[index],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Available Services',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 30,
                  )),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    service.length, // Use service.length for dynamic list size
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: primaryColor,
                      elevation: 4,
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              service[index]
                                  .icon
                                  .icon, // Access icon data from the Icon widget in service
                              size: 40, // Increased size
                              color:
                                  Colors.white, // Changed color to blueAccent
                            ),
                            SizedBox(height: 10),
                            Text(
                              service[index].name, // Use the service name
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Activities',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 30,
                  )),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.spa,
                        size: 40,
                        color: Colors.greenAccent,
                      ),
                      title: Text(
                        "Additional Service ${index + 1}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Description of service ${index + 1}",
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        // Handle additional service details
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
