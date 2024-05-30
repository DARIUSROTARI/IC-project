import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proiect_ic/Services/auth_service.dart';
import 'package:proiect_ic/services/helper.dart';

import '../components/Parfum.dart';
import '../pages/main_page.dart';

class ParfumService {

  static Map<String, String> headers = {"Content-Type" : "application/json"};

  static void createParfum(BuildContext context, int destination) async {

    int? userId = await Helper.getUserId();

    String? category = await Helper.getCategory();
    String? types = await Helper.getTypes();
    String? quantity = await Helper.getQuantity();
    String? essences = await Helper.getEssences();

    print(userId);

    Map data = {
      "category": category,
      "type": types,
      "quantity": quantity,
      "parfumEssences": [
        essences
      ]
    };

    print(data);

    var body = jsonEncode(data);
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/parfumes/user-id=${userId}/destination=${destination}");

    print(url);

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

  static Future<List<Parfum>?> getFavourites() async {
    int? userId = await Helper.getUserId();
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/parfumes/user-id=${userId}/favourite");

    http.Response response = await http.get(
        url,
        headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> responseBody = json.decode(response.body);
      return responseBody.map((json) => Parfum.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load favorites');
    }
  }

  static Future<List<Parfum>> getCart() async {
    int? userId = await Helper.getUserId();
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/parfumes/user-id=${userId}/cart");
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
      final List<dynamic> responseBody = json.decode(response.body);
      return responseBody.map((json) => Parfum.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load favorites');
    }
  }

  static void moveParfumFromFavouritesToCart() async {
    int? userId = await Helper.getUserId();
    int? parfumId = await Helper.getParfumId();
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/parfumes/user-id=${userId}/move-favourite-to-cart/${parfumId}");

    print(url);

    http.Response response = await http.put(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print("Success");
    } else {
      throw Exception('Failed to move to cart');
    }
  }

  static void removeFromFavourites() async {
    int? userId = await Helper.getUserId();
    int? parfumId = await Helper.getParfumId();
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/parfumes/user-id=${userId}/favourite/${parfumId}");

    print(url);

    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    if (response.statusCode == 204) {
      print("Delete successfully from favourites list!");
    } else {
      throw Exception('Failed to delete from favourites!');
    }
  }

  static void removeFromCart() async {
    int? userId = await Helper.getUserId();
    int? parfumId = await Helper.getParfumId();
    var url = Uri.parse("http://10.0.2.2:8080/api/v1/parfumes/user-id=${userId}/cart/${parfumId}");

    print(url);

    http.Response response = await http.delete(
      url,
      headers: headers,
    );
    if (response.statusCode == 204) {
      print("Delete successfully from cart!");
    } else {
      throw Exception('Failed to delete from cart');
    }
  }
}