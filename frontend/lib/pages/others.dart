import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proiect_ic/pages/essences.dart';
import '../components/appbar.dart';
import '../models/others_model.dart';
export '../models/others_model.dart';
import '../pages/quantity.dart';
import '../services/helper.dart';

class OthersWidget extends StatefulWidget {
  const OthersWidget({Key? key}) : super(key: key);

  @override
  State<OthersWidget> createState() => _OthersWidgetState();
}

class _OthersWidgetState extends State<OthersWidget> {
  late
  OthersModel othersModel = OthersModel();

  @override
  void initState() {
    super.initState();
    othersModel.initState(context);
  }

  @override
  void dispose() {
    othersModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20), // Adăugăm padding-ul de 10
                child: AppbarWidget(),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Others',
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You can choose maximum 5 different scents\n*You can also choose from the other essences \nin limit of a total of 5 scents*',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(200, 0, 0, 0),
                child: Row(

                  children: [
                    Image.asset(
                      'assets/images/cocoa.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  buildCheckboxRow('Tobacco',othersModel.checkboxValue1, (newValue) {
                    setState(() {
                      othersModel.checkboxValue1 = newValue;
                      Helper.setScent('Tobacco', 1);
                    });
                  }),
                  buildCheckboxRow('Leather', othersModel.checkboxValue2, (newValue) {
                    setState(() {
                      othersModel.checkboxValue2 = newValue;
                    });
                  }),
                  buildCheckboxRow('Chocolate', othersModel.checkboxValue3, (newValue) {
                    setState(() {
                      othersModel.checkboxValue3 = newValue;
                    });
                  }),
                  buildCheckboxRow('Caramel', othersModel.checkboxValue4, (newValue) {
                    setState(() {
                      othersModel.checkboxValue4 = newValue;
                    });
                  }),
                  buildCheckboxRow('Shea Butter', othersModel.checkboxValue5, (newValue) {
                    setState(() {
                      othersModel.checkboxValue5 = newValue;
                    });
                  }),
                  buildCheckboxRow('Truffles', othersModel.checkboxValue5, (newValue) {
                    setState(() {
                      othersModel.checkboxValue6 = newValue;
                    });
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => EssencesWidget()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Text(
                      '< Back to Essences',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Adaugă un spațiu de 10 între butoane
                  ElevatedButton(
                    onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuantityWidget()));},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Text(
                      'Save',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
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

  int _selectedCount = 0;
  Widget buildCheckboxRow(String label, bool? value, ValueChanged<bool?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.,
        children: [
          Checkbox(
            value: value,
            onChanged: (newValue) {
              if (newValue == true && _selectedCount >= 5) {
                // Dacă se încearcă selectarea unui nou checkbox și s-au selectat deja 5, nu se face nimic
                return;
              }
              // Actualizează numărul de checkbox-uri selectate
              if (newValue == true) {
                _selectedCount++;
              } else {
                _selectedCount--;
              }
              // Actualizează starea checkbox-ului
              onChanged(newValue);
            },
          ),
          Text(
            label,
            style: GoogleFonts.playfairDisplay(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
