import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/rooms.dart';

class RoomTile extends StatelessWidget {
  final Rooms rooms;
  const RoomTile({
    super.key,
    required this.rooms,
  });

  @override
  Widget build(BuildContext context) {
    // Define a base color for the monochromatic scheme
    final Color baseColor = Colors.blue;

    return Container(
      decoration: BoxDecoration(
        // Use a lighter shade of the base color for the background
        color:
            baseColor.withOpacity(0.1), // Adjust opacity for a lighter effect
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            rooms.imagePath,
            height: 130,
          ),
          Text(
            rooms.name,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '' + rooms.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.smoke_free, color: Colors.yellow[900]),
                    Text(rooms.rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
