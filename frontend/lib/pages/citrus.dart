import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proiect_ic/pages/essences.dart';
import '../components/appbar.dart';
import '../models/citrus_model.dart';
export '../models/citrus_model.dart';
import '../pages/quantity.dart';
import '../services/helper.dart';

class CitrusWidget extends StatefulWidget {
  const CitrusWidget({Key? key}) : super(key: key);

  @override
  State<CitrusWidget> createState() => _CitrusWidgetState();
}

class _CitrusWidgetState extends State<CitrusWidget> {
  late CitrusModel citrusModel = CitrusModel();

  @override
  void initState() {
    super.initState();
    citrusModel.initState(context);
  }

  @override
  void dispose() {
    citrusModel.dispose();
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
                      'Citrus',
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
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(

                  children: [
                    Image.asset(
                      'assets/images/lemon.jpeg',
                      width: 280,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  buildCheckboxRow('Lemon',citrusModel.checkboxValue1, (newValue) {
                    setState(() {
                      citrusModel.checkboxValue1 = newValue;
                      Helper.setScent('Lemon', 1);
                    });
                  }),
                  buildCheckboxRow('Orange', citrusModel.checkboxValue2, (newValue) {
                    setState(() {
                      citrusModel.checkboxValue2 = newValue;
                    });
                  }),
                  buildCheckboxRow('Lime', citrusModel.checkboxValue3, (newValue) {
                    setState(() {
                      citrusModel.checkboxValue3 = newValue;
                    });
                  }),
                  buildCheckboxRow('Grapefruit', citrusModel.checkboxValue4, (newValue) {
                    setState(() {
                      citrusModel.checkboxValue4 = newValue;
                    });
                  }),
                  buildCheckboxRow('Mandarin', citrusModel.checkboxValue5, (newValue) {
                    setState(() {
                      citrusModel.checkboxValue5 = newValue;
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
