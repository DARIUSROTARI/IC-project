import 'package:proiect_ic/Pages/authmain_widget.dart';
import 'package:flutter/material.dart';
import 'package:proiect_ic/pages/Register.dart';
import 'package:proiect_ic/pages/essences.dart';

void main() => runApp(MaterialApp(
  home: EssencesWidget(),
  routes: {
      //'/home': (context) => GetStartedWidget(),
      'register': (context) =>CreateAccountWidget(),

  },
));