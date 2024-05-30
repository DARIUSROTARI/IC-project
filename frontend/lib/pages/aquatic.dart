import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proiect_ic/pages/essences.dart';
import 'package:proiect_ic/pages/quantity.dart';
import '../components/appbar.dart';
import '../models/aquatic_model.dart';
import '../services/helper.dart';
export '../models/aquatic_model.dart';

class AquaticWidget extends StatefulWidget {
  const AquaticWidget({Key? key}) : super(key: key);

  @override
  State<AquaticWidget> createState() => _AquaticWidgetState();
}

class _AquaticWidgetState extends State<AquaticWidget> {
  late AquaticModel aquaticModel = AquaticModel();

  @override
  void initState() {
    super.initState();
    aquaticModel.initState(context);
  }

  @override
  void dispose() {
    aquaticModel.dispose();
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
                      'Aquatic',
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

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(

                  children: [
                    Image.asset(
                      'assets/images/waves.jpeg',
                      width: 250,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  buildCheckboxRow('Sea Water',aquaticModel.checkboxValue1, (newValue) {
                    setState(() {
                      aquaticModel.checkboxValue1 = newValue;
                      Helper.setScent('SEA_WATER', 1);
                    });
                  }),
                  buildCheckboxRow('Sea Moss', aquaticModel.checkboxValue2, (newValue) {
                    setState(() {
                      aquaticModel.checkboxValue2 = newValue;
                    });
                  }),
                  buildCheckboxRow('Marine Notes', aquaticModel.checkboxValue3, (newValue) {
                    setState(() {
                      aquaticModel.checkboxValue3 = newValue;
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
