import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthmainWidget extends StatefulWidget {
  const AuthmainWidget({Key? key}) : super(key: key);

  @override
  State<AuthmainWidget> createState() => _AuthmainWidgetState();
}

class _AuthmainWidgetState extends State<AuthmainWidget> {
  late TextEditingController _textFieldController1;
  late TextEditingController _textFieldController2;

  @override
  void initState() {
    super.initState();
    _textFieldController1 = TextEditingController();
    _textFieldController2 = TextEditingController();
  }

  @override
  void dispose() {
    _textFieldController1.dispose();
    _textFieldController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Image.asset(
                  'assets/images/Screenshot_2024-03-23_at_10.28.37.png',
                  width: 300,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  'Your Fragrance, Your Story...',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _textFieldController1,
                    decoration: InputDecoration(
                      labelText: 'Enter your name or e-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _textFieldController2,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle login button press
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
                Text(
                  'Don\'t have an account yet?',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle register button press
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
