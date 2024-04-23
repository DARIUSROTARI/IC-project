import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../pages/citrus.dart';
import '../models/appbar_model.dart';

class CitrusModel extends ChangeNotifier {
  late AppbarModel appbarModel;
  final unfocusNode = FocusNode();

  // State fields for Checkbox widgets
  bool? checkboxValue1 = false;
  bool? checkboxValue2 = false;
  bool? checkboxValue3 = false;
  bool? checkboxValue4 = false;
  bool? checkboxValue5 = false;


  void initState(BuildContext context) {
    appbarModel = AppbarModel();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}
