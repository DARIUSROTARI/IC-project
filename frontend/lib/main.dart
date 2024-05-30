import 'package:proiect_ic/Pages/authmain_widget.dart';
import 'package:flutter/material.dart';
import 'package:proiect_ic/pages/Register.dart';
import 'package:proiect_ic/pages/essences.dart';
import 'package:proiect_ic/pages/order_details_page.dart';
import 'package:proiect_ic/pages/place_order.dart';

void main() => runApp(MaterialApp(
  home: AuthmainWidget(),
  routes: {
      //'/home': (context) => GetStartedWidget(),
      'register': (context) =>CreateAccountWidget(),

  },
));

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

// void main() {
//   runApp(MaterialApp(
//     home: OrderFormPage(),
//   ));
// }