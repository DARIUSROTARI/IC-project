import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/appbar.dart';
import '../models/appbar_model.dart';
import '../pages/category.dart';

class CategoryModel extends ChangeNotifier {
  final unfocusNode = FocusNode();
  late AppbarModel appbarModel;

  void initState(BuildContext context) {
    appbarModel = Provider.of<AppbarModel>(context, listen: false);
  }

  void dispose() {
    unfocusNode.dispose();
  }
}
