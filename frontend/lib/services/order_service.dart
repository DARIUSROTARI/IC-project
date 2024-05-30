import 'package:flutter/material.dart';
import 'package:proiect_ic/pages/order_details_page.dart';

import '../components/address.dart';
import '../pages/main_page.dart';
import 'helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class OrderService {

  static Map<String, String> headers = {"Content-Type" : "application/json"};

  static void placeOrder(BuildContext context, String country, String region, String city,
                         String postCode, String address, String phone,
                         String deliveryMethod, String paymentMethod) async {
    int? userId = await Helper.getUserId();
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/orders/user-id=${userId}");

    print(url);

    Map data = {
      "addressDTO" : Address(
        country: country,
        region: region,
        city: city,
        postCode: postCode,
        address: address,
        phone: phone,
      ).toJson(),
      "deliveryMethod": "FAN_COURIER",
      "paymentMethod": "RAMBURS"
    };

    print(data);

    http.Response response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      print("Place order success!");
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageWidget())); // Navigăm către pagina principală
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to move to cart');
    }
  }
}