import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/appbar.dart';
import '../models/quantity_model.dart';
export '../models/quantity_model.dart';
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
                padding: EdgeInsets.symmetric(vertical: 20), // Adăugăm padding-ul de 10
                child: AppbarWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
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
                  buildCheckboxRow('30 ml', quantityModel.checkboxValue1, (newValue) {
                    setState(() {
                      quantityModel.checkboxValue1 = newValue;
                    });
                  }),
                  buildCheckboxRow('50 ml', quantityModel.checkboxValue2, (newValue) {
                    setState(() {
                      quantityModel.checkboxValue2 = newValue;
                    });
                  }),
                  buildCheckboxRow('80 ml', quantityModel.checkboxValue3, (newValue) {
                    setState(() {
                      quantityModel.checkboxValue3 = newValue;
                    });
                  }),
                  buildCheckboxRow('100 ml', quantityModel.checkboxValue4, (newValue) {
                    setState(() {
                      quantityModel.checkboxValue4 = newValue;
                    });
                  }),
                  buildCheckboxRow('125 ml', quantityModel.checkboxValue5, (newValue) {
                    setState(() {
                      quantityModel.checkboxValue5 = newValue;
                    });
                  }),
                ],
              ),
              ElevatedButton(
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
              ElevatedButton(
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/IMG_4744.JPG',
                  width: 100,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckboxRow(String label, bool? value, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
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
