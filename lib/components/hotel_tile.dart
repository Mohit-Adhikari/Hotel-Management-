import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/hotels.dart';

class HotelTile extends StatelessWidget {
  final Hotels hotels;
  final void Function()? onTap;

  const HotelTile({super.key, required this.hotels, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
        ),
        margin: EdgeInsets.only(left: screenWidth * 0.05),
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Hotel Image
            Image.asset(
              hotels.imagePath,
              height: screenHeight * 0.15, // Dynamically set height
              width: screenWidth * 0.35,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.01),
            // Hotel Name
            Text(
              hotels.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: screenWidth * 0.05,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            // Location and Rating
            SizedBox(
              width: screenWidth * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Location
                  Flexible(
                    child: Text(
                      hotels.location,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: screenWidth * 0.035,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[900],
                        size: screenWidth * 0.04,
                      ),
                      Text(
                        hotels.rating,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
