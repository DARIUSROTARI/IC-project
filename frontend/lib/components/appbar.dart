import 'package:flutter/material.dart';
import '../models/appbar_model.dart';
export '../models/appbar_model.dart';
import 'package:google_fonts/google_fonts.dart';

import"../pages/menu.dart";
export"../pages/menu.dart";

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  late AppbarModel _model;

  @override
  void initState() {
    super.initState();
    _model = AppbarModel();
    _model.initState(context);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Container(
              width: 75,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MenuWidget()));
                      },
                      style: ButtonStyle( // Adăugarea unui ButtonStyle pentru a defini culoarea butonului
                        backgroundColor: MaterialStateProperty.all(Colors.black), // Setarea culorii butonului la negru
                      ),
                      child: Text(
                        'Menu',
                        style: GoogleFonts.playfairDisplay(
                          color:Colors.white,
                          textStyle: TextStyle(
                            fontSize:10,
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(190, 0, 0, 0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/images.png',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/online-shop-icon-vector.jpg',
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
