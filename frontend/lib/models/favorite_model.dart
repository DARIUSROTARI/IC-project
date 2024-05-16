import 'package:flutter/foundation.dart';
import 'package:proiect_ic/pages/quantity.dart';
import 'package:proiect_ic/models/types_model.dart';
import 'package:proiect_ic/models/essences_model.dart';
import 'package:proiect_ic/pages/types.dart';
import '../models/category_model.dart';

class FavoriteItem {
  final CategoryModel _category;
  final TypesModel _type;
  final QuantityModel _quantity;
  final List<EssencesModel> _parfumEssences;
  final int _id;

  FavoriteItem({
    required CategoryModel category,
    required TypesModel type,
    required QuantityModel quantity,
    required List<EssencesModel> parfumEssences,
    required int id,
  })  : _category = category,
        _type = type,
        _quantity = quantity,
        _parfumEssences = parfumEssences,
        _id = id;

  // Getters
  CategoryModel get category => _category;
  TypesModel get type => _type;
  QuantityModel get quantity => _quantity;
  List<EssencesModel> get parfumEssences => _parfumEssences;
  int get id => _id;
}
