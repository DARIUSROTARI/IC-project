// import 'package:flutter/material.dart';
//
// class OrderDetailsPage extends StatelessWidget {
//   final List<Map<String, dynamic>> orders;
//
//   OrderDetailsPage(this.orders);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detalii comandă'),
//       ),
//       body: ListView.builder(
//         itemCount: orders.length,
//         itemBuilder: (context, index) {
//           final order = orders[index];
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Adresă de livrare:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 4.0),
//                   Text('Țară: ${order['addressDTO']['country']}'),
//                   Text('Regiune: ${order['addressDTO']['region']}'),
//                   Text('Oraș: ${order['addressDTO']['city']}'),
//                   Text('Cod poștal: ${order['addressDTO']['postCode']}'),
//                   Text('Adresă: ${order['addressDTO']['address']}'),
//                   Text('Telefon: ${order['addressDTO']['phone']}'),
//                   SizedBox(height: 16.0),
//                   Text(
//                     'Produse:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 4.0),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: order['parfums'].length,
//                     itemBuilder: (context, index) {
//                       final product = order['parfums'][index];
//                       return ListTile(
//                         title: Text(
//                           'Parfum ${index + 1}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Categorie: ${product['category']}'),
//                             Text('Tip: ${product['type']}'),
//                             Text('Cantitate: ${product['quantity']}'),
//                             Text('Esente parfum: ${product['parfumEssences'].join(', ')}'),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: OrderDetailsPage([
//       {
//         "id": 1,
//         "addressDTO": {
//           "country": "România",
//           "region": "București",
//           "city": "București",
//           "postCode": "010101",
//           "address": "Strada Exemplu nr. 123",
//           "phone": "0712345678"
//         },
//         "deliveryMethod": "FAN_COURIER",
//         "paymentMethod": "RAMBURS",
//         "parfums": [
//           {
//             "category": "MALE",
//             "type": "EXTRAIT_DE_PARFUM",
//             "quantity": "ML_30",
//             "parfumEssences": ["FLORAL"],
//             "id": 1
//           },
//           {
//             "category": "MALE",
//             "type": "EXTRAIT_DE_PARFUM",
//             "quantity": "ML_30",
//             "parfumEssences": ["FLORAL"],
//             "id": 2
//           }
//         ]
//       }
//     ]),
//   ));
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert'; // For json decoding
import 'package:http/http.dart' as http;

import '../services/helper.dart'; // For http requests

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  List<Map<String, dynamic>> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      int? userId = await Helper.getUserId();
      final response = await http.get(Uri.parse("http://10.0.2.2:8080/api/v1/orders/all/user-id=${userId}"));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          orders = data.cast<Map<String, dynamic>>();
          isLoading = false;
        });
      } else {
        // Handle non-200 status codes here
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      // Handle exceptions here
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 60.0), // Adjust the height as needed
        child: Padding(
            padding: EdgeInsets.only(top: 60.0), // Adjust the padding as needed
            child:AppBar(
        title: Text('Order Details',
          style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),),
      ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address:',
                    style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text('Country: ${order['addressDTO']['country']}'),
                  Text('Region: ${order['addressDTO']['region']}'),
                  Text('City: ${order['addressDTO']['city']}'),
                  Text('Postal Code: ${order['addressDTO']['postCode']}'),
                  Text('Address: ${order['addressDTO']['address']}'),
                  Text('Telefon: ${order['addressDTO']['phone']}'),
                  SizedBox(height: 16.0),
                  Text(
                    'Perfumes:',
                    style: GoogleFonts.playfairDisplay( // Folosim Google Fonts pentru fontul Playfair Display
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: order['parfums'].length,
                    itemBuilder: (context, index) {
                      final product = order['parfums'][index];
                      return ListTile(
                        title: Text(
                          'Parfum ${index + 1}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Category: ${product['category']}'),
                            Text('Type: ${product['type']}'),
                            Text('Quantity: ${product['quantity']}'),
                            Text('Essences: ${product['parfumEssences'].join(', ')}'),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
