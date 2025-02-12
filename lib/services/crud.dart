import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference hotel =
      FirebaseFirestore.instance.collection('Owner');
  final CollectionReference tables =
      FirebaseFirestore.instance.collection('Table');
  final CollectionReference resturant_chef =
      FirebaseFirestore.instance.collection('Chef');
  final CollectionReference order_collection =
      FirebaseFirestore.instance.collection('Order');
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

  Future<void> addChefRequest(BuildContext context, String chef,
      String chef_email, Map<String, dynamic> restaurant) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Add the chef request to Firestore
      await hotel.doc(restaurant['uid']).collection('chefs').doc(chef).set({
        'chef': chef,
        'status': 'pending',
        'email': chef_email,
      });
      await resturant_chef.doc(chef).set({
        'status': 'pending',
      }, SetOptions(merge: true));

      // Close the loading dialog
      Navigator.pop(context);

      // Show success dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Chef Request added successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Error adding chef request: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> addOrder(
      BuildContext context, String owner, Map<String, dynamic> order) async {
    // Show Circular Progress Indicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await order_collection.doc(owner).collection('orders').add(order);

      // Close the loading dialog
      Navigator.pop(context);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ordered Items Suceesfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating order $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
