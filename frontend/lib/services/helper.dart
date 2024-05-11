import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper{
  static void setCategory(category) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('category', category);
  }

  static Future<String?> getCategory(index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('category');
  }

  static void setEssences(essences) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('essences', essences);
  }

  static Future<String?> getEssences(index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('essences');
  }

  static void setTypes(types) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('types', types);
  }

  static Future<String?> getTypes(index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('types');
  }

  static void setQuantity(quantity) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('quantity', quantity);
  }

  static Future<String?> getQuantity(index) async {
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


  }
