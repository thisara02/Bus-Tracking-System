import 'package:flutter/material.dart';
import 'package:navii/fourth.dart';
import 'date&time.dart'; // Importing seventh screen

class SeventhPage extends StatelessWidget {
  final List<int> selectedSeats;

  const SeventhPage({required this.selectedSeats});

  @override
  Widget build(BuildContext context) {
    // Calculate total payment
    int totalPayment = selectedSeats.length * 500; // Assuming $500 per seat

    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Seats:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedSeats.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Seat ${selectedSeats[index]}'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Payment: $totalPayment', // Display total payment
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimeAndDatePage(),
                  ),
                );
              },
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
