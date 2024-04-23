import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../pages/aquatic.dart';
import '../models/appbar_model.dart';

class AquaticModel extends ChangeNotifier {
  late AppbarModel appbarModel;
  final unfocusNode = FocusNode();

  // State fields for Checkbox widgets
  bool? checkboxValue1 = false;
  bool? checkboxValue2 = false;
  bool? checkboxValue3 = false;


  void initState(BuildContext context) {
    appbarModel = AppbarModel();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}
