import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:crypto/crypto.dart';

class RegisterModel extends ChangeNotifier {
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );
  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstnameController;
  String? Function(BuildContext, String?)? firstnameValidator;
  String? _firstnameControllerValidator(BuildContext context, String? val) { // Actualizăm numele funcției
    if (val == null || val.isEmpty) { // Verificăm dacă câmpul este gol
      return 'First name is required!'; // Returnăm un mesaj de eroare corespunzător
    }

    return null;
  }

  FocusNode? lastNameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameValidator;
  String? _secondnameControllerValidator(BuildContext context, String? val) { // Actualizăm numele funcției
    if (val == null || val.isEmpty) { // Verificăm dacă câmpul este gol
      return 'Second name is required!'; // Returnăm un mesaj de eroare corespunzător
    }

    return null;
  }

  FocusNode? dobFocusNode;
  TextEditingController? dateofbirthController;
  String? Function(BuildContext, String?)? dobValidator;
  String? _dobControllerValidator(BuildContext context, String? val) { // Actualizăm numele funcției
    if (val == null || val.isEmpty) { // Verificăm dacă câmpul este gol
      return 'Date of birth is required!'; // Returnăm un mesaj de eroare corespunzător
    }

    return null;
  }

  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) { // Actualizăm numele funcției
    if (val == null || val.isEmpty) { // Verificăm dacă câmpul este gol
      return 'Password is required!'; // Returnăm un mesaj de eroare corespunzător
    }

    return null;
  }


  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailValidator;
  String? _emailControllerValidator(BuildContext context, String? val) { // Actualizăm numele funcției
    if (val == null || val.isEmpty) { // Verificăm dacă câmpul este gol
      return 'Email is required!'; // Returnăm un mesaj de eroare corespunzător
    }
    if (!emailRegex.hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // FocusNode? confirmPasswordFocusNode;
  // TextEditingController? confirmyourpasswordController;
  // String? Function(BuildContext, String?)? confirmPasswordValidator;

  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmyourpasswordController;
  String? Function(BuildContext, String?)? confirmPasswordValidator;
  String? _confirmPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required!';
    }
    if (passwordController != null && passwordController!.text != val) {
      return 'Passwords do not match!';
    }
    return null;
  }

  void initState(BuildContext context) {
    firstnameValidator =_firstnameControllerValidator;
    lastnameValidator=_secondnameControllerValidator;
    dobValidator=_dobControllerValidator;
    passwordValidator=_passwordControllerValidator;
    emailValidator=_emailControllerValidator;
    confirmPasswordValidator = _confirmPasswordControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstnameController?.dispose();

    lastNameFocusNode?.dispose();
    lastnameController?.dispose();

    dobFocusNode?.dispose();
    dateofbirthController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmyourpasswordController?.dispose();
  }

  String? createAccount(BuildContext context, String firstName, String lastName, String dateofbirth, String email, String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match!';
    }

    var bytesPassword = utf8.encode(password);
    var hashPassword = sha256.convert(bytesPassword);
    AuthService.register(context, firstName, lastName, dateofbirth, email, hashPassword.toString());
    return null;
  }

}
