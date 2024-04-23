import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';
import '../models/appbar_model.dart';
import '../pages/types.dart' show TypesWidget;

class TypesModel extends ChangeNotifier {
  // State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  // Model for appbar component.
  late AppbarModel appbarModel;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Checkbox widget.
  bool? checkboxValue3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Checkbox widget.
  bool? checkboxValue4;

  void initState(BuildContext context) {
    appbarModel = AppbarModel();
    expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
    expandableExpandableController4 =
        ExpandableController(initialExpanded: false);
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    super.dispose();
  }

  void handleCheckboxValueChanged(int checkboxIndex) {
    // Dezactivați toate celelalte casete de selectare
    checkboxValue1 = (checkboxIndex == 1) ? true : false;
    checkboxValue2 = (checkboxIndex == 2) ? true : false;
    checkboxValue3 = (checkboxIndex == 3) ? true : false;
    checkboxValue4 = (checkboxIndex == 4) ? true : false;

    // Anunțați modificările către consumatori
    notifyListeners();
  }
}
