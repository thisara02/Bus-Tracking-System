import 'package:flutter/material.dart';
import 'six.dart'; // Importing sixth screen
import 'seven.dart'; // Importing seventh screen

class FifthPage extends StatefulWidget {
  final String itemText;

  const FifthPage({required this.itemText});

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  List<bool> seatSelection = List.generate(20, (index) => false);
  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fifth Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            widget.itemText,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SixthPage(), // Navigate to sixth.dart
                ),
              );
            },
            icon: Icon(Icons.location_on), // Adding the location icon
            label: Text('Live Location', style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      seatSelection[index] = !seatSelection[index];
                      selectedCount = seatSelection.where((selected) => selected).length;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: seatSelection[index] ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Seat ${index + 1}',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Selected Seat Count: $selectedCount',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              List<int> selectedSeats = [];
              for (int i = 0; i < seatSelection.length; i++) {
                if (seatSelection[i]) {
                  selectedSeats.add(i + 1); // Seat numbers start from 1
                }
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeventhPage(selectedSeats: selectedSeats),
                ),
              );
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
