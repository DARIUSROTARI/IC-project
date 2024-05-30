import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proiect_ic/Pages/authmain_widget.dart';
import 'package:proiect_ic/services/helper.dart';
import 'package:crypto/crypto.dart';

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
      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthmainWidget())); // Navigăm către pagina principală
    } else {
      print("Error!");
    }
  }

  // static void login(BuildContext context, String email,
  //     String password) async {
  //
  //   var bytesPassword = utf8.encode(password);
  //   var hashPassword = sha256.convert(bytesPassword);
  //
  //   Map data = {
  //     "email": email,
  //     "password": hashPassword.toString(),
  //   };
  //
  //   var body = jsonEncode(data);
  //   var url = Uri.parse("http://10.0.2.2:8080/api/v1/users/login");
  //   Map<String, String> cookies = {};
  //
  //   http.Response response = await http.post(
  //       url,
  //       headers: headers,
  //       body: body
  //   );
  //
  //   print("status: ${response.statusCode}");
  //
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     int id;
  //     String firstname;
  //     String lastname;
  //     String email;
  //     String dateOfBirth;
  //     Map<String, dynamic> responseData = jsonDecode(response.body);
  //     if (responseData.containsKey('id')) {
  //       print("Id: ${responseData['id']}");
  //       id = responseData['id'];
  //       firstname = responseData['lastName'];
  //       lastname = responseData['firstName'];
  //       email = responseData['email'];
  //       dateOfBirth = responseData['dateOfBirth'];
  //       Helper.setUserId(id);
  //       Helper.setFirstname(firstname);
  //       Helper.setLastname(lastname);
  //       Helper.setEmail(email);
  //       Helper.setDateOfBirth(dateOfBirth);
  //     }
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageWidget())); // Navigăm către pagina principală
  //   } else {
  //     print("Error!");
  //   }
  // }

  static Future<String?> login(BuildContext context, String email, String password) async {
    var bytesPassword = utf8.encode(password);
    var hashPassword = sha256.convert(bytesPassword);

    Map<String, String> data = {
      "email": email,
      "password": hashPassword.toString(),
    };

    var body = jsonEncode(data);
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/users/login");

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print("status: ${response.statusCode}");

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData.containsKey('id')) {
        int id = responseData['id'];
        String firstname = responseData['lastName'];
        String lastname = responseData['firstName'];
        String email = responseData['email'];
        String dateOfBirth = responseData['dateOfBirth'];
        Helper.setUserId(id);
        Helper.setFirstname(firstname);
        Helper.setLastname(lastname);
        Helper.setEmail(email);
        Helper.setDateOfBirth(dateOfBirth);
      }
      return null; // Autentificarea a fost reușită, deci returnăm null
    } else {
      print("Error: ${response.body}");
      String errorMessage = "INCORRECT PASSWORD !!! "; // Mesajul de eroare implicit
      // Poți adapta mesajul de eroare în funcție de răspunsul primit de la server
      return errorMessage; // Returnăm un mesaj de eroare
    }
  }


}