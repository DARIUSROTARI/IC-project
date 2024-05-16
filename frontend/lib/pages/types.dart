import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/appbar.dart';
import '../models/types_model.dart';
import '../pages/essences.dart';
import '../pages/category.dart';
import '../services/helper.dart';

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

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
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
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Types',
                      style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                        textStyle: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ExpandableNotifier(
                          controller: _model.expandableExpandableController1,
                          child: ExpandablePanel(
                            header: Text(
                              'Extrait du Parfum',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            collapsed: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Align(
                                  alignment: Alignment.center,
                                child: Text(
                                  'details',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                ),
                              ),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Conține 15-30% esență de parfum.\nExtractul de parfum durează mai mult de opt ore pe piele .',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            theme: const ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: false,
                              tapBodyToCollapse: false,
                              headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                              expandIcon: Icons.keyboard_arrow_down,
                              collapseIcon: Icons.keyboard_arrow_up_rounded,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      value: _model.checkboxValue1 ??= false,
                      onChanged: (newValue) async {
                        if (newValue == true) {
                          setState(() {
                            _model.checkboxValue1 = newValue!;
                            Helper.setTypes("EXTRAIT DU PARFUM");
                            _model.checkboxValue2 = false;
                            _model.checkboxValue3 = false;
                            _model.checkboxValue4 = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ExpandableNotifier(
                          controller: _model.expandableExpandableController2,
                          child: ExpandablePanel(
                            header: Text(
                              'Eau de Parfum',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            collapsed: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Align(
                                  alignment: Alignment.center,
                                child: Text(
                                  'details',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                              ),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Conține 8-15% esență de parfum și durează cinci sau mai multe ore pe piele. ',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            theme: const ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: false,
                              tapBodyToCollapse: false,
                              headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                              expandIcon: Icons.keyboard_arrow_down,
                              collapseIcon: Icons.keyboard_arrow_up_rounded,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      value: _model.checkboxValue2 ??= false,
                      onChanged: (newValue) async {
                        if (newValue == true) {
                          setState(() {
                            _model.checkboxValue1 = false;
                            _model.checkboxValue2 = newValue!;
                            Helper.setTypes('EAU DE PARFUM');
                            _model.checkboxValue3 = false;
                            _model.checkboxValue4 = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ExpandableNotifier(
                          controller: _model.expandableExpandableController3,
                          child: ExpandablePanel(
                            header: Text(
                              'Eau de Toilette',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            collapsed: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Align(
                                  alignment: Alignment.center,
                                child: Text(
                                  'details',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                ),
                              ),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Conține 4-8% esență de parfum. \nApa de toaletă durează aproximativ trei ore.',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            theme: const ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: false,
                              tapBodyToCollapse: false,
                              headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                              expandIcon: Icons.keyboard_arrow_down,
                              collapseIcon: Icons.keyboard_arrow_up_rounded,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      value: _model.checkboxValue3 ??= false,
                      onChanged: (newValue) async {
                        if (newValue == true) {
                          setState(() {
                            _model.checkboxValue1 = false;
                            _model.checkboxValue2 = false;
                            _model.checkboxValue3 = newValue!;
                            Helper.setTypes('EAU DE TOILETTE');
                            _model.checkboxValue4 = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ExpandableNotifier(
                          controller: _model.expandableExpandableController4,
                          child: ExpandablePanel(
                            header: Text(
                              'Eau de Cologne',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            collapsed: Container(
                              height: 40,
                              decoration: BoxDecoration(
                               // color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Align(
                                  alignment: Alignment.center,
                                child: Text(
                                  'details',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                ),
                              ),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    'Apa de Colonie conține 3-5% esență de parfum și de obicei se evaporă în două ore. ',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                                      textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            theme: const ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: false,
                              tapBodyToCollapse: false,
                              headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                              expandIcon: Icons.keyboard_arrow_down,
                              collapseIcon: Icons.keyboard_arrow_up_rounded,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      value: _model.checkboxValue4 ??= false,
                      onChanged: (newValue) async {
                        if (newValue == true) {
                          setState(() {
                            _model.checkboxValue1 = false;
                            _model.checkboxValue2 = false;
                            _model.checkboxValue3 = false;
                            _model.checkboxValue4 = newValue!;
                            Helper.setTypes('EAU DE COLOGNE');
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35, left: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black!,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                           TextButton(
                          onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryWidget()));
                          },
                         child: Text(
                            '< Back to Category',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
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
                          // Verifică dacă cel puțin una dintre casetele de bifare este bifată
                          if (_model.checkboxValue1 == true ||
                              _model.checkboxValue2 == true ||
                              _model.checkboxValue3 == true ||
                              _model.checkboxValue4 == true) {
                            // Dacă este bifată cel puțin o casetă de bifare, navighează către pagina următoare
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => EssencesWidget()));
                          } else {
                            // Altfel, afișează un mesaj că trebuie să bifezi cel puțin o opțiune
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Please select at least one option before saving.'),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Save >',
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
}
