import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../models/essences_model.dart';
import 'package:google_fonts/google_fonts.dart';

export '../models/essences_model.dart';

class EssencesWidget extends StatefulWidget {
  const EssencesWidget({Key? key}) : super(key: key);

  @override
  State<EssencesWidget> createState() => _EssencesWidgetState();
}

class _EssencesWidgetState extends State<EssencesWidget> {
  late EssencesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = EssencesModel();
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
        backgroundColor: Colors.white, // Choose your preferred background color
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
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Essences',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildContainer('Floral'),
              _buildContainer('Citrus'),
              _buildContainer('Woody'),
              _buildContainer('Fruity'),
              _buildContainer('Spicy'),
              _buildContainer('Herbal'),
              _buildContainer('Aquatic'),
              _buildContainer('Oriental'),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 57),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),

                      ),
                    ),
                  ],
                ),
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
          color: Colors.grey, // Choose your preferred color
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black, // Choose your preferred color
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(
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
