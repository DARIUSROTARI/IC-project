import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstnameController;
  String? Function(BuildContext, String?)? firstNameValidator;

  FocusNode? lastNameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? secondNameValidator;

  FocusNode? dobFocusNode;
  TextEditingController? dateofbirthController;
  String? Function(BuildContext, String?)? dobValidator;

  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordValidator;

  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailValidator;

  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmyourpasswordController;
  String? Function(BuildContext, String?)? confirmPasswordValidator;

  @override
  void initState(BuildContext context) {}

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
}
