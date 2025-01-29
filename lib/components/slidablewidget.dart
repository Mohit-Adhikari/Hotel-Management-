import 'package:flutter/material.dart';

class Order {
  final String tableNumber;
  final Map<String, int> items; // Food item and quantity

  Order({required this.tableNumber, required this.items});
}

class ChefOrderPage extends StatefulWidget {
  const ChefOrderPage({super.key});

  @override
  State<ChefOrderPage> createState() => _ChefOrderPageState();
}

class _ChefOrderPageState extends State<ChefOrderPage> {
  List<Order> orders = [
    Order(tableNumber: "1", items: {
      "Pizza": 2,
      "Burger": 1,
    }),
    Order(tableNumber: "2", items: {"Momo": 3, "Pasta": 1}),
    Order(tableNumber: "3", items: {"Noodles": 2, "Wings": 4}),
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.3),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, // 4% of screen width
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: orders.length,
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02), // 2% of screen height
          itemBuilder: (context, index) {
            final order = orders[index];
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  orders.removeAt(index);
                });
              },
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(direction == DismissDirection.startToEnd
                          ? "Delete"
                          : "Mark as Completed"),
                      content: Text(direction == DismissDirection.startToEnd
                          ? "Are you sure you want to delete this order?"
                          : "Are you sure you want to mark this order as completed?"),
                      actions: <Widget>[
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Yes")),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05), // 5% of screen width
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05), // 5% of screen width
                child: const Icon(Icons.check, color: Colors.white),
              ),
              key: ValueKey<String>(order.tableNumber),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      screenWidth * 0.05), // 5% of screen width
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(
                    top: screenHeight * 0.01), // 1% of screen height
                padding:
                    EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side: Table Number
                    Row(
                      children: [
                        Icon(Icons.table_restaurant,
                            size: screenWidth * 0.06), // 6% of screen width
                        SizedBox(
                            width: screenWidth * 0.02), // 2% of screen width
                        Text(
                          order.tableNumber,
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.045, // 4.5% of screen width
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Right side: Food Items and Quantities
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: order.items.entries.map((entry) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  screenHeight * 0.01), // 1% of screen height
                          child: Row(
                            children: [
                              Icon(Icons.restaurant,
                                  size:
                                      screenWidth * 0.05), // 5% of screen width
                              SizedBox(
                                  width:
                                      screenWidth * 0.02), // 2% of screen width
                              Text(
                                "${entry.key}: ${entry.value}",
                                style: TextStyle(
                                  fontSize:
                                      screenWidth * 0.04, // 4% of screen width
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
