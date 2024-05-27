import 'package:flutter/material.dart';
import 'package:proiect_ic/Pages/authmain_widget.dart';

import '../services/helper.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<Map<String, String>>(
          future: _getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('No data available'));
            } else {
              var userData = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileItem(label: 'First Name', value: userData['firstName'] ?? ''),
                  ProfileItem(label: 'Last Name', value: userData['lastName'] ?? ''),
                  ProfileItem(label: 'Email', value: userData['email'] ?? ''),
                  ProfileItem(label: 'Date of Birth', value: userData['dateOfBirth'] ?? ''),
                  Spacer(), // This pushes the button to the bottom
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Log out logic here
                        // For example, you can navigate to the login page
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => AuthmainWidget()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Text('Logout'),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<Map<String, String>> _getUserData() async {
    String? firstName = await Helper.getFirstname();
    String? lastName = await Helper.getLastname();
    String? email = await Helper.getEmail();
    String? dateOfBirth = await Helper.getDateOfBirth();
    return {
      'firstName': firstName ?? '',
      'lastName': lastName ?? '',
      'email': email ?? '',
      'dateOfBirth': dateOfBirth ?? '',
    };
  }
}

class ProfileItem extends StatelessWidget {
  final String label;
  final String value;

  ProfileItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
