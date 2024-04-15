import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/appbar.dart';
import '../models/types_model.dart';

export '../models/types_model.dart';

class TypesWidget extends StatefulWidget {
  const TypesWidget({Key? key}) : super(key: key);

  @override
  State<TypesWidget> createState() => _TypesWidgetState();
}

class _TypesWidgetState extends State<TypesWidget> {
  late TypesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TypesModel();
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
                padding: EdgeInsets.only(top: 40),
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
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Types',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                          color:Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              _buildContainer('Extrait de Parfum'),
              _buildContainer('Eau de Parfum'),
              _buildContainer('Eau de Toilette'),
              _buildContainer('Eau de Cologne'),
              _buildContainer('Splash Cologne'),
              _buildContainer('Body Oil'),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/IMG_4742.JPG',
                      height: 200,
                      fit: BoxFit.cover,
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

  Widget _buildContainer(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 57, vertical: 10),
      child: Container(
        width: 274,
        height: 43,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(
                color:Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
