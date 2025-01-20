import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/components/button.dart';
import 'package:hotel_management/components/hotel_tile.dart';
import 'package:hotel_management/models/hotels.dart';
import 'package:hotel_management/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List stays = [
    Hotels(
        name: 'Soaltee',
        location: 'Bhaktapur',
        imagePath: 'lib/images/sunbed.png',
        rating: '3.9'),
    Hotels(
        name: 'Everest',
        location: 'Naxal',
        imagePath: 'lib/images/home.png',
        rating: '4.1'),
    Hotels(
        name: 'Mariot',
        location: 'Baneshwor',
        imagePath: 'lib/images/hotel.png',
        rating: '3.9'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Text('Stays', style: TextStyle(color: Colors.grey[900])),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(25),
            margin: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get 32% Promo.',
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20, color: Colors.white)),
                    const SizedBox(height: 20),
                    MyButton(text: 'Reedem Now', onTap: () {}),
                  ],
                ),
                Image.asset(
                  'lib/images/bathrobe.png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          //search bar

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Search for stays',
              ),
            ),
          ),
          const SizedBox(height: 25),
          //list of stays
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Popular Stays',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stays.length,
            itemBuilder: (context, index) => HotelTile(
              hotels: stays[index],
            ),
          )),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('lib/images/london-bridge.png', height: 60),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'London Bridge',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        Text(
                          'United Kingdom',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
