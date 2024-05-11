import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/category_model.dart';
export '../models/category_model.dart';
import '../components/appbar.dart';
import '../pages/types.dart';
import '../pages/main_page.dart';
import '../models/types_model.dart';
import '../services/helper.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late CategoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = CategoryModel();
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
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: AppbarWidget(),
                    ),
                  ],
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
           child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Category',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
        ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Helper.setCategory("Male");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TypesWidget()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.black),
                    ),
                    minimumSize: Size(150, 80),
                  ),
                  child: Text(
                    'Male',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Helper.setCategory("Female");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TypesWidget()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.black),
                    ),
                    minimumSize: Size(150, 80),
                  ),
                  child: Text(
                    'Female',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Helper.setCategory("Unisex");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TypesWidget()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.black),
                    ),
                    minimumSize: Size(150, 80),
                  ),
                  child: Text(
                    'Unisex',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
               // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Button for navigating to main page
                  Padding(
                    padding:  EdgeInsets.fromLTRB(57, 50, 57, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to main page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageWidget()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: Colors.black),
                        ),
                       // minimumSize: Size(, 80),
                      ),
                      child: Text(
                        '< Back to HomePage',
                        style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
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
