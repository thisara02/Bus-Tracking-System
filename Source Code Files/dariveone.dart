import 'dart:js';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import 'package:navii/fourth.dart';

class DriveOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String date = "";
    String time = "";
    String from = "";
    String to = "";

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Next Ride'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                date = value;
              },
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            TextField(
              onChanged: (value) {
                time = value;
              },
              decoration: InputDecoration(
                labelText: 'Time',
              ),
            ),
            TextField(
              onChanged: (value) {
                from = value;
              },
              decoration: InputDecoration(
                labelText: 'From',
              ),
            ),
            TextField(
              onChanged: (value) {
                to = value;
              },
              decoration: InputDecoration(
                labelText: 'To',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Create a string with driver details
                String details = '$date, $time, $from, $to';
                // Save driver details to Firestore
                saveDriverDetailsToFirestore(details);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void saveDriverDetailsToFirestore(String details) async {
    try {
      // Access Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add document with driver details to Firestore collection
      await firestore.collection('drivers').add({
        'details': details,
        // You can add more fields as needed
      });

      // Navigate to the FourthPage with accepted details
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(
          builder: (context) => FourthPage(acceptedItem: details),
        ),
      );
    } catch (e) {
      print('Error saving driver details: $e');
      // Handle any errors here
    }
  }
}
