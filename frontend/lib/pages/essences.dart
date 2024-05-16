import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../models/essences_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/types.dart';
import '../pages/floral.dart';
import '../pages/citrus.dart';
import '../pages/woody.dart';
import '../pages/fruity.dart';
import '../pages/spicy.dart';
import '../pages/aquatic.dart';
import '../pages/herbal.dart';
import '../pages/others.dart';
import '../services/helper.dart';
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
              _buildContainer('Floral',() {
                Helper.setEssences('FLORAL');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FloralWidget()));
              }),
              // Pass the onPressed handler to the _buildContainer function
              _buildContainer('Citrus',(){
                Helper.setEssences('CITRUS');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CitrusWidget()));}),
              _buildContainer('Woody',(){
                Helper.setEssences('WOODY');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WoodyWidget()));}),
              _buildContainer('Fruity',(){
                Helper.setEssences('FRUITY');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FruityWidget()));}),
              _buildContainer('Spicy',(){
                Helper.setEssences('SPICY');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpicyWidget()));}),
              _buildContainer('Herbal',(){
                Helper.setEssences('HERBAL');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HerbalWidget()));}),
              _buildContainer('Aquatic',(){
                Helper.setEssences('AQUATIC');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AquaticWidget()));}),
              _buildContainer('Others',(){
                Helper.setEssences('OTHERS');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OthersWidget()));}),
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
              Padding(
                padding: EdgeInsets.only(top: 25, left: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black!,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TypesWidget()));
                        },
                        child: Text(
                          '< Back to Types',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
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

  Widget _buildContainer(String text,VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 57, vertical: 10),
      child: Container(
        width: 274,
        height: 43,
        decoration: BoxDecoration(
          color: Colors.grey[300], // Choose your preferred color
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black, // Choose your preferred color
          ),
        ),
        child: InkWell(
          onTap: onPressed,
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
      ),
    );
  }
}
