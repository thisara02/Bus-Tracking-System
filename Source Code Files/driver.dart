import 'package:flutter/material.dart';
import 'dariveone.dart';

class DrivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for bus name and booked seats
    String busName = "XYZ Bus";
    int bookedSeats = 20; // Example value, you can replace it with actual booked seats data

    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bus Name: $busName',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Adding some space between title and content
            Text(
              'Booked Seats: $bookedSeats',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20), // Adding some space between content and button
            ElevatedButton(
              onPressed: () {
                // Navigate to DriverOne page when button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrivePage()),
                );
              },
              child: Text('Next Ride Add'),
            ),
          ],
        ),
      ),
    );
  }
}