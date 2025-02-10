import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference hotel =
      FirebaseFirestore.instance.collection('Owner');
  final CollectionReference tables =
      FirebaseFirestore.instance.collection('Table');
  Future<void> addRestaurant(
      BuildContext context, String owner, String resturant) async {
    // Show Circular Progress Indicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await hotel.doc(owner).update({
        'resturant': resturant,
      });

      // Close the loading dialog
      Navigator.pop(context);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Restaurant updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating restaurant: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> addLocation(
      BuildContext context, String owner, String location) async {
    // Show Circular Progress Indicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await hotel.doc(owner).update({
        'location': location,
      });

      // Close the loading dialog
      Navigator.pop(context);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating location: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> addTable(BuildContext context, String owner, int table) async {
    // Show Circular Progress Indicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await hotel.doc(owner).update({
        'table': table,
      });
      Map<String, bool> __table = {};
      for (int i = 1; i <= table; i++) {
        __table[i.toString()] = false;
      }
      await tables
          .doc(owner)
          .collection('today')
          .doc('table_status')
          .set(__table);
      await tables
          .doc(owner)
          .collection('tommorow')
          .doc('table_status')
          .set(__table);
      await tables
          .doc(owner)
          .collection('day_after')
          .doc('table_status')
          .set(__table);

      // Close the loading dialog
      Navigator.pop(context);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('table updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating table $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> addPrice(BuildContext context, String owner, int price) async {
    // Show Circular Progress Indicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await hotel.doc(owner).update({
        'price': price,
      });

      // Close the loading dialog
      Navigator.pop(context);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('price updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating table $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> addMenu(BuildContext context, String Owner, String foodName,
      int foodPrice, String foodDescription) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await hotel.doc(Owner).collection('menu').add({
        'foodName': foodName,
        'foodPrice': foodPrice,
        'foodDescription': foodDescription,
      });
      // Close the loading dialog
      Navigator.pop(context);
      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Menu Item added successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Close the loading dialog
      Navigator.pop(context);
      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding menu item: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
