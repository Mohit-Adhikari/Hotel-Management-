import 'package:flutter/material.dart';

class OngoingBooking extends StatelessWidget {
  const OngoingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongoing Booking'),
      ),
      body: const Center(
        child: Text('Ongoing Booking'),
      ),
    );
  }
}