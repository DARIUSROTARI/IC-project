import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proiect_ic/Pages/authmain_widget.dart';
import 'package:proiect_ic/pages/order_details_page.dart';

import '../services/helper.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 60.0), // Adjust the height as needed
        child: Padding(
          padding: EdgeInsets.only(top: 60.0), // Adjust the padding as needed
          child: AppBar(
            title: Text('Profile',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

          ),
        ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ProfileItem(label: 'First Name', value: userData['firstName'] ?? ''),
                  ProfileItem(label: 'Last Name', value: userData['lastName'] ?? ''),
                  ProfileItem(label: 'Email', value: userData['email'] ?? ''),
                  ProfileItem(label: 'Date of Birth', value: userData['dateOfBirth'] ?? ''),
                  SizedBox(height: 70), // Add space between the last item and the button
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Edit profile logic here
                            // For example, navigate to the edit profile page
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => OrderDetailsPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            'Your orders',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20), // Add space between the buttons
                        ElevatedButton(
                          onPressed: () {
                            // Log out logic here
                            // For example, you can navigate to the login page
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => AuthmainWidget()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            'Logout',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$label: ',
            //textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                //fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Text(
            value,
           // textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                //fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
