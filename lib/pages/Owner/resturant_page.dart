import 'package:flutter/material.dart';

class ResturantPage extends StatelessWidget {
  const ResturantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resturant Page'),
      ),
      body: Padding(
        // Add padding on the left and right sides
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Adjust the value as needed
        
      ),
    );
  }
}