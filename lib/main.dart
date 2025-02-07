import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/pages/Admin/adminHome.dart';
import 'package:hotel_management/pages/Chefs/orders.dart';
import 'package:hotel_management/pages/Owner/owner_homepage.dart';
import 'package:hotel_management/pages/Owner/owner_signup.dart';

import 'package:hotel_management/pages/booking_sucess.dart';
import 'package:hotel_management/pages/home_page.dart';
import 'package:hotel_management/pages/intro_pages.dart';
import 'package:hotel_management/pages/login_page.dart';
import 'package:hotel_management/pages/menu_page.dart';
import 'package:hotel_management/pages/resturant_tile.dart';
import 'package:hotel_management/pages/signIn_page.dart';
import 'package:hotel_management/pages/sign_up.dart';
import 'package:hotel_management/pages/table_booking_page.dart';
import 'package:hotel_management/pages/table_page.dart';
import 'package:hotel_management/pages/hiddendrawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          '/resturanttilepage': (context) => ResturantTile(),
          '/adminhomepage': (context) => AdminHome(),
          '/cheforderpage': (context) => ChefOrders(),
          '/ownerhomepage': (context) => OwnerHomepage(),
          '/hiddendrawer': (context) => HiddenDrawer(),
          '/homepage': (context) => MyHomePage(),
          '/intropage': (context) => IntroPages(),
          '/menupage': (context) => MenuPage(),
          '/loginpage': (context) => LoginPage(),
          '/signuppage': (context) => SignUpScreen(),
          '/bookingsuccess': (context) => UploadSuccessfulScreen(),
          '/ownersignup': (context) => OwnerSignup(),
        });
  }
}
