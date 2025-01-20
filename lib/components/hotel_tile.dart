import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/hotels.dart';

class HotelTile extends StatelessWidget {
  final Hotels hotels;
  final void Function()? onTap;
  const HotelTile({super.key, 
  required this.hotels,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(left: 25),
          padding: const EdgeInsets.all(25),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  hotels.imagePath,
                  height: 140,
                ),
                Text(hotels.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                    )),
                SizedBox(
                    width: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '' + hotels.location,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow[900]),
                            Text(hotels.rating),
                          ],
                        )
                      ],
                    ))
              ])),
    );
  }
}
