import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../pages/main_page.dart';


class AuthService {

  static Map<String, String> headers = {"Content-Type" : "application/json"};

  static void register(BuildContext context, String firstName,String lastName, String dateOfBirth, String email,
      String password) async {
    Map data = {
      "firstName": firstName,
      "lastName": lastName,
      "dateOfBirth":dateOfBirth,
      "email": email,
      "password": password,
    };

    var body = jsonEncode(data);
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/users/registration");

    http.Response response = await http.post(
        url,
        headers: headers,
        body: body
    );

    print("status: ${response.statusCode}");

    if (response.statusCode == 201) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageWidget())); // Navigăm către pagina principală
    } else {
      print("Error!");
    }
  }

  static void login(BuildContext context, String email,
      String password) async {
    Map data = {
      "email": email,
      "password": password,
    };

    var body = jsonEncode(data);
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/users/login");
    Map<String, String> cookies = {};

    http.Response response = await http.post(
        url,
        headers: headers,
        body: body
    );

    print("status: ${response.statusCode}");

    if (response.statusCode == 200) {
      print(response.body);
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageWidget())); // Navigăm către pagina principală
    } else {
      print("Error!");
    }
  }
}