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
      FirebaseFirestore.instance.collection('User');

  AuthService(
      {required this.emailText,
      required this.passwordText,
      this.confirmPasswordText,
      this.usernameText // Added confirmPasswordText
      });

  void registerUser(BuildContext context) async {
    // Added BuildContext context
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: CircularProgressIndicator(),
      ),
    );

    if (passwordText != confirmPasswordText) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return; // Added return to stop further execution
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );
      String? uid = userCredential.user?.uid;
      clients.doc(uid).set({
        'uid': uid,
        'email': emailText,
        'username': usernameText,
      });

      clients.doc(uid).collection('Booking').doc('today').set({});

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resgistered user successfully')),
      );
      Navigator.pop(context);
      // Close the dialog on success
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Close the dialog on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'An error occurred')),
      );
    } finally {
      // Ensure the dialog is closed in case of any unexpected errors
      Navigator.pop(context);
    }
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'An error occurred')),
      );
    } finally {
      //Navigator.pop(context);
    }
  }
}
