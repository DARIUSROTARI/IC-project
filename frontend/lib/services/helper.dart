import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper{
  static void setCategory(category) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('category', category);
  }

  static Future<String?> getCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('category');
  }

  static void setEssences(essences) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('essences', essences);
  }

  static Future<String?> getEssences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('essences');
  }

  static void setTypes(types) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('types', types);
  }

  static Future<String?> getTypes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('types');
  }

  static void setQuantity(quantity) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('quantity', quantity);
  }

  static Future<String?> getQuantity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('quantity');
  }

 static void setScent(scent, index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('scents[' + index.toString() + ']', scent);
  }

 static Future<String?> getScent(index) async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString('scents[' + index.toString() + ']');
 }

  static void setUserId(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', id);
  }

  static Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  static void setFirstname(String firstname) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstname', firstname);
  }

  static Future<String?> getFirstname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('firstname');
  }

  static void setLastname(String lastname) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lastname', lastname);
  }

  static Future<String?> getLastname() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastname');
  }

  static void setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static void setDateOfBirth(String dateOfBirth) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dateOfBirth', dateOfBirth);
  }

  static Future<String?> getDateOfBirth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('dateOfBirth');
  }

  static void setParfumId(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('parfumId', id);
  }

  static Future<int?> getParfumId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('parfumId');
  }
}
