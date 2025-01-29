import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart'; // Ensure this package is added to your pubspec.yaml
import 'package:hotel_management/components/slidablewidget.dart'; // Ensure this import is correct
import 'package:hotel_management/components/slide_to_act widget.dart'; // Ensure this import is correct

class ChefOrders extends StatelessWidget {
  const ChefOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.3),
        title: const Text('Chef Orders'),
        elevation: 0, // Remove the shadow
      ),
      body: const ChefOrderPage(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Ensure the column takes minimal space
          children: [
            const Text(
              'Swipe to End your shift',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // 1% of screen height
            SizedBox(
              height: screenHeight * 0.08, // 8% of screen height
              child: const SlideToActWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
