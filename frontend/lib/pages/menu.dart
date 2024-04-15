import 'package:flutter/material.dart';
import 'package:proiect_ic/pages/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import'../pages/category.dart';
import '../pages/types.dart';
import '../pages/essences.dart';
import '../pages/quantity.dart';
import '../models/menu_model.dart';
export '../models/menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
      _model = MenuModel();
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
      onTap: () {
        if (_model.unfocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(_model.unfocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Menu',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildMenuItem('Category'),
              buildMenuItem('Types'),
              buildMenuItem('Essences'),
              buildMenuItem('Perfume quantity'),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 180, // Adjusted width to fit the text
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: ()  {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageWidget()),);
                      },
                      child:Text(
                        ' <  Back to About us ',
                        style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
    child: InkWell(
      onTap: () {
      if (title == 'Category') {
      Navigator.push(context,MaterialPageRoute(builder: (context) => CategoryWidget()),);
    }
      else if (title == 'Types') {
      Navigator.push(context,MaterialPageRoute(builder: (context) => TypesWidget()),);
    }

      else if (title == 'Essences') {
      Navigator.push(context,MaterialPageRoute(builder: (context) => EssencesWidget()),);
    }

      else if (title == 'Perfume quantity') {
      Navigator.push(context,MaterialPageRoute(builder: (context) => QuantityWidget()),);
    }
    },
      child: Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(
              color:Colors.black,
                fontSize: 25,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

          ],
        ),
      ),
      ),
    );
  }
}
