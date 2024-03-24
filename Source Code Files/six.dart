import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapsPage(), // Navigate to MapsPage
              ),
            );
          },
          child: Text('Open Google Maps'),
        ),
      ),
    );
  }
}

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  List<int> availableSeats = List.generate(20, (index) => index + 1);
  List<int> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Seat'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: availableSeats.length,
          itemBuilder: (context, index) {
            final seatNumber = availableSeats[index];
            return ListTile(
              title: Text('Seat $seatNumber'),
              onTap: () {
                setState(() {
                  selectedSeats.add(seatNumber);
                  availableSeats.remove(seatNumber);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save selected seats to Firestore
          saveSelectedSeatsToFirestore(selectedSeats);
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Future<void> _launchGoogleMaps() async {
    final url = 'https://www.google.com/maps/search/?api=1&query=My+Location';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> saveSelectedSeatsToFirestore(List<int> seats) async {
    // You can implement Firestore saving logic here
    // For simplicity, I'm just printing the selected seats
    print('Selected Seats: $seats');
    // Here you can save the selected seats to Firestore
  }
}
