import 'package:flutter/material.dart';

class TableSetting extends StatelessWidget {
  const TableSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Setting'),
      ),
      body: Padding(
        // Add padding on the left and right sides
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Adjust the value as needed
        
      ),
    );
  }
}