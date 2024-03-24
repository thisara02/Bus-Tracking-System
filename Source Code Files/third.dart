import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ThirdPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController telephoneNumberController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EASY BUS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Registration',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: birthdayController,
                decoration: InputDecoration(
                  labelText: 'Birthday',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: telephoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Telephone Number',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 20),
              Text('Select your role:'),
              RadioListTile<String>(
                title: Text('Passenger'),
                value: 'passenger',
                groupValue: 'role',
                onChanged: (String? value) {
                  // Handle passenger radio button selection
                },
              ),
              RadioListTile<String>(
                title: Text('Bus Driver'),
                value: 'driver',
                groupValue: 'role',
                onChanged: (String? value) {
                  // Handle bus driver radio button selection
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement signup functionality
                  _signUp(context);
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp(BuildContext context) {
    // Access the Firebase Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a new document reference with an auto-generated ID
    DocumentReference docRef = firestore.collection('users').doc();

    // Add data to Firestore
    docRef.set({
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'birthday': birthdayController.text,
      'telephoneNumber': telephoneNumberController.text,
      'address': addressController.text,
    }).then((value) {
      // Data added successfully
      // Show a success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User registered successfully!'),
      ));
    }).catchError((error) {
      // Handle any errors
      print("Failed to add user: $error");
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to register user. Please try again later.'),
      ));
    });
  }
}
