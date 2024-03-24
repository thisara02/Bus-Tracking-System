import 'package:flutter/material.dart';
import 'fifth.dart'; // Importing fifth screen
import 'seven.dart'; // Importing seventh screen

class FourthPage extends StatefulWidget {
  final String acceptedItem;

  FourthPage({required this.acceptedItem});

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  List<String> acceptedItems = [];

  @override
  void initState() {
    if (widget.acceptedItem.isNotEmpty) {
      acceptedItems.add(widget.acceptedItem);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Your existing code for the FourthPage...
          // You can display accepted items here using acceptedItems list
        ],
      ),
    );
  }
}
