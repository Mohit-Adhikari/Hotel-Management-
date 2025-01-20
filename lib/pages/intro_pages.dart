import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/components/button.dart';

class IntroPages extends StatelessWidget {
  const IntroPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 138, 60, 55),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 25),
                  Text("HOTEL MAN",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset('lib/images/resort.png'),
                  ),
                  const SizedBox(height: 25),
                  Text("THE BEST HOTEL EXPERIENCE",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 44,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 25),
                  Text(
                      "Book your stay with us and experience the luxury, whether it's a business trip or a vacation, we have the best deals for you.",
                      style: TextStyle(
                        height: 2,
                        color: Colors.grey[200],
                      )),
                  const SizedBox(height: 25),
                  MyButton(
                    text: 'Get Started',
                    onTap: () {
                      Navigator.pushNamed(context, '/menupage');
                    },
                  ),
                ]),
          ),
        ));
  }
}
