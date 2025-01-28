import 'package:flutter/material.dart';
import 'package:hotel_management/components/tab_bar.dart';

class OwnerHomepage extends StatelessWidget {
  const OwnerHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner'),
      ),
      body: Padding(
        // Add padding on the left and right sides
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Adjust the value as needed
        child: SecondaryTabbar(
          radius: 10,
        ),
        
      ),
    );
  }
}
