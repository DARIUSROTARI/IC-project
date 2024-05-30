import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proiect_ic/services/order_service.dart';

class OrderFormPage extends StatefulWidget {
  @override
  _OrderFormPageState createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'country': '',
    'region': '',
    'city': '',
    'postCode': '',
    'address': '',
    'phone': '',
    'deliveryMethod': 'FAN_COURIER',
    'paymentMethod': 'RAMBURS',
  };

  final TextEditingController _deliveryMethodController =
  TextEditingController(text: 'FAN_COURIER');

  final TextEditingController _paymentMethodController =
  TextEditingController(text: 'RAMBURS');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 70.0), // Adjust the height as needed
    child: Padding(
    padding: EdgeInsets.only(top: 70.0,bottom:20),
     child: AppBar(
        title: Text('Complete Order\'s Details',
        style: GoogleFonts.playfairDisplay(
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
        ),
      ),
    ),
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Country'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please introduce your country!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['country'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Region'),
                onSaved: (value) => _formData['region'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                onSaved: (value) => _formData['city'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Post Code'),
                onSaved: (value) => _formData['postCode'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) => _formData['address'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onSaved: (value) => _formData['phone'] = value,
              ),
              TextFormField(
                controller: _deliveryMethodController,
                decoration: InputDecoration(labelText: 'Delivery Method'),
                readOnly: true, // Makes the field read-only
                onSaved: (value) {
                  // This onSaved will use the static value since the field is read-only
                  _formData['deliveryMethod'] = _deliveryMethodController.text;
                },
              ),
              TextFormField(
                controller: _paymentMethodController,
                decoration: InputDecoration(labelText: 'Payment Method'),
                readOnly: true, // Makes the field read-only
                onSaved: (value) {
                  // This onSaved will use the static value since the field is read-only
                  _formData['paymentMethod'] = _paymentMethodController.text;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Salvarea datelor formularului
                    print(_formData);
                    OrderService.placeOrder(context, _formData['country'], _formData['region'],
                        _formData['city'], _formData['postCode'],
                        _formData['address'], _formData['phone'],
                        _formData['deliveryMethod'], _formData['paymentMethod']);   // aici adaugi toti parametrii
                  }
                },
                child: Text('Complete order',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: OrderFormPage(),
//   ));
// }
