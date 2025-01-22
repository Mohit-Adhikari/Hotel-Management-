import 'package:flutter/material.dart';
import 'package:hotel_management/themes/colors.dart';

class SeatSelectionWidget extends StatefulWidget {
  const SeatSelectionWidget({super.key});

  @override
  SeatSelectionWidgetState createState() => SeatSelectionWidgetState();
}

class SeatSelectionWidgetState extends State<SeatSelectionWidget> {
  List<Seat> seats =
      List.generate(15, (index) => Seat()); // Reduced to 15 tiles

  void toggleSeatSelection(int index) {
    setState(() {
      seats[index].isSelected = !seats[index].isSelected;
    });
  }

  int getSelectedSeatsCount() {
    return seats.where((seat) => seat.isSelected).length;
  }

  double getTotalPrice() {
    return seats
        .where((seat) => seat.isSelected)
        .fold(0.0, (sum, seat) => sum + seat.price);
  }

  @override
  void initState() {
    super.initState();

    // Example: Mark some seats as reserved
    seats[5].isReserved = true;
    seats[10].isReserved = true;
    seats[12].isReserved = true;
  }

  @override
  Widget build(BuildContext context) {
    int selectedSeatsCount = getSelectedSeatsCount();
    double totalPrice = getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Selection'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[300],
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 600 ? 8 : 4;

          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: seats.length,
                  itemBuilder: (context, index) {
                    return SeatWidget(
                      isSelected: seats[index].isSelected,
                      isReserved: seats[index].isReserved,
                      isAvailable: seats[index].isAvailable,
                      onTap: () => toggleSeatSelection(index),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BookingInfoWidget(
                          color: Color.fromARGB(255, 129, 199, 132),
                          label: 'Available'),
                      BookingInfoWidget(color: Colors.red, label: 'Reserved'),
                      BookingInfoWidget(
                          color: Colors.yellow, label: 'Selected'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '\$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                              text:
                                  '\n$selectedSeatsCount seat${selectedSeatsCount == 1 ? '' : 's'}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (selectedSeatsCount > 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '$selectedSeatsCount seats booked for \$${totalPrice.toStringAsFixed(2)}!',
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 40,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () =>
                              {Navigator.pushNamed(context, '/loginpage')},
                          child: const Text(
                            'BOOK NOW',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Supporting Widgets and Models

class BookingInfoWidget extends StatelessWidget {
  final Color color;
  final String label;

  const BookingInfoWidget({
    super.key,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

class Seat {
  bool isAvailable;
  bool isSelected;
  bool isReserved;
  double price;

  Seat({
    this.isAvailable = true,
    this.isSelected = false,
    this.isReserved = false,
    this.price = 29.99,
  });
}

class SeatWidget extends StatelessWidget {
  final bool isSelected;
  final bool isReserved;
  final bool isAvailable;
  final VoidCallback onTap;

  const SeatWidget({
    super.key,
    required this.isSelected,
    required this.isReserved,
    required this.isAvailable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    if (isSelected) {
      seatColor = Colors.yellow;
    } else if (isReserved) {
      seatColor = Colors.red;
    } else if (isAvailable) {
      seatColor = primaryColor; // Use primary color
    } else {
      seatColor = Colors.grey;
    }

    return GestureDetector(
      onTap: isAvailable && !isReserved ? onTap : null,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12),
        ),
        child: const Icon(
          Icons.dining,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
