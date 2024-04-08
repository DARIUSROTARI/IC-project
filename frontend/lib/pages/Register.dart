import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:proiect_ic/pages/main_page.dart';
import 'package:proiect_ic/services/auth_service.dart';
import '../models/register_model.dart'; // Importăm modelul de creare a contului
export '../models/register_model.dart';


class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key? key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
  final bool isWeb = kIsWeb;
  late RegisterModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = RegisterModel();
    _model.initState(context);

    _model.lastnameController = TextEditingController(); // Inițializăm controllerul pentru prenume
    _model.firstnameController = TextEditingController(); // Inițializăm controllerul pt nume
    _model.dateofbirthController = TextEditingController(); // Inițializăm controllerul de data nasterii
    _model.emailController = TextEditingController();//email
    _model.passwordController = TextEditingController();//parola
    _model.confirmyourpasswordController = TextEditingController();//confirma parola

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
            setState(() {
              _isKeyboardVisible = visible;
            });
          });
    }
  }

  @override
  void dispose() {
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    _model.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Opacity(
                      opacity: 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/Screenshot_2024-03-23_at_10.28.37.png',
                          width: 200,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                        textStyle: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57, 5, 57, 0),
                  child: TextFormField(
                    controller: _model.lastnameController,
                    focusNode: _model.firstNameFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: ' Last name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57, 5, 57, 0),
                  child: TextFormField(
                    controller: _model.lastnameController,
                    focusNode: _model.lastNameFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'First name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57, 5, 57, 0),
                  child: TextFormField(
                    controller: _model.dateofbirthController,
                    focusNode: _model.dobFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Date of birth',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57, 5, 57, 0),
                  child: TextFormField(
                    controller: _model.emailController,
                    focusNode: _model.emailFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57, 5, 57, 0),
                  child: TextFormField(
                    controller: _model.passwordController,
                    focusNode: _model.passwordFocusNode,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57, 5, 57, 0),
                  child: TextFormField(
                    controller: _model.confirmyourpasswordController,
                    focusNode: _model.confirmPasswordFocusNode,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm your password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: 210,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: TextButton( // Folosim un TextButton pentru a gestiona evenimentul de apăsare
                      onPressed: () {
                        AuthService.register(context, _model.firstnameController!.text, _model.lastnameController!.text,
                            _model.dateofbirthController!.text, _model.emailController!.text, _model.passwordController!.text);
                        },
                    child: Center(
                      child: Text(
                        style:GoogleFonts.playfairDisplay(),
                        'Create Account',
                      ),
                    ),
                  ),
                ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(170, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/IMG_4750.jpg',
                            width: 214,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
