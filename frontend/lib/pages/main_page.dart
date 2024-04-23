import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../models/mainpage_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/category.dart';

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
        backgroundColor: Colors.white, // or any color you prefer
        body: SingleChildScrollView( // Wrap your content in a SingleChildScrollView
          child: Column(
            mainAxisSize: MainAxisSize.min, // Change to min to prevent overflow
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AppbarWidget(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Add some spacing between widgets
              Opacity(
                opacity: 0.7,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/Screenshot_2024-03-23_at_10.28.37.png',
                      width: 170,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some spacing between widgets
              Text(
                'Few things about us',
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some spacing between widgets
              Text(
                ' Have you ever searched for the perfect scent, \ntailored just for you, when choosing a perfume?\nOften, what you found on the market wasn\'t exactly\n what you desired. \nWe have come up with the solution to your problem.\nWe offer a diverse range of fragrances \nand categories that will surely please you! \nUnleash your imagination and \ncreate your own perfume with our help!\n',
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some spacing between widgets
              GestureDetector(
                onTap: () {
                  // Navigate to categories page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryWidget()),
                  );
                },
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/images/cropped_image.png',
                      width: 344,
                      height: 165,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some spacing between widgets
              Text(
                'Contact us',
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 10), // Add some spacing between widgets
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(width: 5), // Add some spacing between widgets
                  Text(
                    'artduparfum',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5), // Add some spacing between widgets
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/744_email.jpg',
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 5), // Add some spacing between widgets
                  Text(
                    'artduparfum@gmail.com',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
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
