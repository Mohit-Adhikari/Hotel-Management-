import 'package:flutter/material.dart';
import 'package:hotel_management/pages/Owner/owner_homepage.dart';
import 'package:hotel_management/pages/booking_sucess.dart';
import 'package:hotel_management/pages/home_page.dart';
import 'package:hotel_management/pages/intro_pages.dart';
import 'package:hotel_management/pages/login_page.dart';
import 'package:hotel_management/pages/menu_page.dart';
import 'package:hotel_management/pages/signIn_page.dart';
import 'package:hotel_management/pages/sign_up.dart';
import 'package:hotel_management/pages/table_booking_page.dart';
import 'package:hotel_management/pages/table_page.dart';
import 'package:hotel_management/pages/hiddendrawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPages(),
        routes: {
          '/ownerhomepage': (context) => OwnerHomepage(),
          '/hiddendrawer': (context) => HiddenDrawer(),
          '/homepage': (context) => MyHomePage(),
          '/intropage': (context) => IntroPages(),
          '/menupage': (context) => MenuPage(),
          '/loginpage': (context) => LoginPage(),
          '/signuppage': (context) => SignUpScreen(),
          '/tablebookingpage': (context) => TableBookingPage(),
          '/tablespage': (context) => SeatSelectionWidget(),
          '/bookingsuccess': (context) => UploadSuccessfulScreen(),
        });
  }
}
