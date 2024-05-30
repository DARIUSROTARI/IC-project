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
  String? _emailError;
  String? _passwordError;
  String? _firstnameError;
  String? _lastnameError;
  String? _dobError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _model = RegisterModel();
    _model.initState(context);

    _model.lastnameController =
        TextEditingController(); // Inițializăm controllerul pentru prenume
    _model.firstnameController =
        TextEditingController(); // Inițializăm controllerul pt nume
    _model.dateofbirthController =
        TextEditingController(); // Inițializăm controllerul de data nasterii
    _model.emailController = TextEditingController(); //email
    _model.passwordController = TextEditingController(); //parola
    _model.confirmyourpasswordController =
        TextEditingController(); //confirma parola
  }
    void _createAccount() {
      setState(() {
        _firstnameError = _model.firstnameValidator!(context, _model.firstnameController!.text);
        _passwordError = _model.passwordValidator!(context, _model.passwordController!.text);
        _emailError = _model.emailValidator!(context, _model.emailController!.text);
        _lastnameError =_model.lastnameValidator!(context,_model.lastnameController!.text);
        _dobError =_model.dobValidator!(context,_model.dateofbirthController!.text);
        _confirmPasswordError = _model.confirmPasswordValidator!(context, _model.confirmyourpasswordController!.text);
        if (_emailError == null && _passwordError == null && _firstnameError == null && _lastnameError==null && _dobError==null && _confirmPasswordError == null) {
          String? createAccountError = _model.createAccount(
            context,
            _model.firstnameController!.text,
            _model.lastnameController!.text,
            _model.dateofbirthController!.text,
            _model.emailController!.text,
            _model.passwordController!.text,
            _model.confirmyourpasswordController!.text,
          );
          if (createAccountError != null) {
            // afișează eroarea în UI
            _confirmPasswordError = createAccountError;
          }

        }
      });
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
                    focusNode: _model.lastNameFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: ' Last name',
                      errorText: _lastnameError,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57, 5, 57, 0),
                  child: TextFormField(
                    controller: _model.firstnameController,
                    focusNode: _model.firstNameFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'First name',
                      errorText: _firstnameError,
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
                      errorText: _dobError,
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
                      errorText: _emailError,
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
                      errorText: _passwordError,
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
                      errorText: _confirmPasswordError,
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
                      onPressed: _createAccount,
                        child: Center(
                          child:Text(
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
