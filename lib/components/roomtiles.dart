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
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
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
              Text(rooms.name,
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                  )),
              SizedBox(
                  width: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '' + rooms.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                      Row(
                        children: [
                          Icon(Icons.smoke_free, color: Colors.yellow[900]),
                          Text(rooms.rating),
                        ],
                      )
                    ],
                  ))
            ]));
  }
}
