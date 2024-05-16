import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/appbar.dart';
import '../models/quantity_model.dart';
export '../models/quantity_model.dart';
import '../pages/essences.dart';
import '../services/helper.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}
class _QuantityWidgetState extends State<QuantityWidget> {
  late QuantityModel quantityModel = QuantityModel();

  @override
  void initState() {
    super.initState();
    quantityModel.initState(context);
  }

  @override
  void dispose() {
    quantityModel.dispose();
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
                padding:const EdgeInsets.only(top: 40.0),
                child: AppbarWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quantity',
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
              Column(
                children: [
                  buildCheckboxRow('30 ml', quantityModel.checkboxValue1),
                  buildCheckboxRow('50 ml', quantityModel.checkboxValue2),
                  buildCheckboxRow('80 ml', quantityModel.checkboxValue3),
                  buildCheckboxRow('100 ml', quantityModel.checkboxValue4),
                  buildCheckboxRow('125 ml', quantityModel.checkboxValue5),
                ],
              ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            width: 150,
          child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black),
                ),

                child: Text(
                  'Add to Favorites',
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                ),
              ),
        ),
         SizedBox(
          width: 150,
          child:ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black),

                ),
                child: Text(
                  'Add to Cart',
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
          ),
              ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EssencesWidget()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black),
                ),
                child: Text(
                  '< Back',
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
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

  Widget buildCheckboxRow(String label, bool? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              // La selectarea unui checkbox, dezactivăm toate celelalte
              switch(label) {
                case '30 ml':
                  {
                    quantityModel.checkboxValue1 = newValue;
                    quantityModel.checkboxValue2 = false;
                    quantityModel.checkboxValue3 = false;
                    quantityModel.checkboxValue4 = false;
                    quantityModel.checkboxValue5 = false;
                    Helper.setQuantity('ML_30');
                    break;
                  }
                case '50 ml':
                  {
                    quantityModel.checkboxValue1 = false;
                    quantityModel.checkboxValue2 = newValue;
                    quantityModel.checkboxValue3 = false;
                    quantityModel.checkboxValue4 = false;
                    quantityModel.checkboxValue5 = false;
                    Helper.setQuantity('ML_50');
                    break;
                  }
                case '80 ml':
                  {
                    quantityModel.checkboxValue1 = false;
                    quantityModel.checkboxValue2 = false;
                    quantityModel.checkboxValue3 = newValue;
                    quantityModel.checkboxValue4 = false;
                    quantityModel.checkboxValue5 = false;
                    Helper.setQuantity('ML_80');
                    break;
                  }
                case '100 ml':
                  {
                    quantityModel.checkboxValue1 = false;
                    quantityModel.checkboxValue2 = false;
                    quantityModel.checkboxValue3 = false;
                    quantityModel.checkboxValue4 = newValue;
                    quantityModel.checkboxValue5 = false;
                    Helper.setQuantity('ML_100');
                    break;
                  }
                case '125 ml':
                  {
                    quantityModel.checkboxValue1 = false;
                    quantityModel.checkboxValue2 = false;
                    quantityModel.checkboxValue3 = false;
                    quantityModel.checkboxValue4 = false;
                    quantityModel.checkboxValue5 =  newValue;
                    Helper.setQuantity('ML_125');
                    break;
                  }
              }
            });
          },
        ),
        Text(
          label,
          style: GoogleFonts.playfairDisplay(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
