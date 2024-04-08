import 'package:flutter/material.dart';
import '../models/mainpage_model.dart'; // Importăm modelul de creare a contului
export '../models/mainpage_model.dart';
import '../components/appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class MainpageWidget extends StatefulWidget {
  const MainpageWidget({Key? key}) : super(key: key);

  @override
  State<MainpageWidget> createState() => _MainpageWidgetState();
}

class _MainpageWidgetState extends State<MainpageWidget> {
  late MainpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = MainpageModel();
    _model.initState(context);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: AppbarWidget(),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/IMG_4707.jpg',
                          width: 400,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Few things about us',
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Text(
                  'Have you ever searched for the perfect scent, tailored just for you, when choosing a perfume?\n Often, what you found on the market wasn\'t exactly what you desired. We have come up with the solution to your problem.\n We offer a diverse range of fragrances and categories that will surely please you! Unleash your imagination and create your own perfume with our help!',
                  style: GoogleFonts.playfairDisplay(
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Contact us',
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Container(
                width: 273,
                height: 30,
                decoration: BoxDecoration(

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          'assets/images/744_email.jpg',
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'artduparfum@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 188,
                height: 32,
                decoration: BoxDecoration(

                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/87390.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        ' artduparfum',
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 191,
                height: 33,
                decoration: BoxDecoration(

                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/facebook-logo-black-2019.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'ArtDuParfum',
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(205, 0, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/Screenshot_2024-03-23_at_10.28.37.png',
                          width: 178,
                          height: 84,
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
    );
  }
}
