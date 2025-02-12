import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  final String emailText;
  final String passwordText;
  final String? confirmPasswordText;
  final String? usernameText;

  final CollectionReference clients =
      FirebaseFirestore.instance.collection('Owner');
  final CollectionReference tables =
      FirebaseFirestore.instance.collection('Table');

  AuthService({
    required this.emailText,
    required this.passwordText,
    this.confirmPasswordText,
    this.usernameText,
  });

  void registerUser(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (context) => const AlertDialog(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text("Registering...."),
          ],
        ),
      ),
    );

    try {
      // Check if passwords match
      if (passwordText != confirmPasswordText) {
        Navigator.pop(context); // Close the loading dialog
        _showErrorDialog(context, 'Passwords do not match', () {
          _navigateToLoginPage(context);
        });
        return; // Stop further execution
      }

      // Create user in Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );

      String? uid = userCredential.user?.uid;

      // Add user data to Firestore
      await clients.doc(uid).set({
        'uid': uid,
        'email': emailText,
        'username': usernameText,
        'resturant': 'Resturant',
        'location': 'Location',
        'table': 0,
        'price': 0
      });

      // Initialize table status collections
      await tables.doc(uid).collection('today').doc('table_status').set({});
      await tables.doc(uid).collection('tommorow').doc('table_status').set({});
      await tables.doc(uid).collection('day_after').doc('table_status').set({});

      // Close the loading dialog
      Navigator.pop(context);

      // Show success dialog and navigate to login page after OK is clicked
      _showSuccessDialog(
          context, 'Registered user successfully at ${DateTime.now()}', () {
        _navigateToLoginPage(context);
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the loading dialog

      // Show error dialog with the Firebase error message and navigate to login page after OK is clicked
      _showErrorDialog(context, e.message ?? 'An error occurred', () {
        _navigateToLoginPage(context);
      });
    } catch (e) {
      Navigator.pop(
          context); // Ensure the loading dialog is closed for any unexpected errors

      // Show error dialog for unexpected errors and navigate to login page after OK is clicked
      _showErrorDialog(context, 'An unexpected error occurred: $e', () {
        _navigateToLoginPage(context);
      });
    }
  }

// Helper method to show success dialog
  void _showSuccessDialog(
      BuildContext context, String message, VoidCallback onOkPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              onOkPressed(); // Navigate to login page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

// Helper method to show error dialog
  void _showErrorDialog(
      BuildContext context, String message, VoidCallback onOkPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              onOkPressed(); // Navigate to login page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

// Method to navigate to the login page
  void _navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context,
        '/hiddendrawer'); // Replace the current route with the login page
  }

  void loginUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: CircularProgressIndicator(),
      ),
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged in successfully')),
      );
      //Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            key: UniqueKey(), content: Text(e.message ?? 'An error occurred')),
      );
    } finally {
      //Navigator.pop(context);
    }
  }

  // Helper method to show a status dialog
}
