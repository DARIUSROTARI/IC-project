import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../models/appbar_model.dart';

class EssencesModel extends ChangeNotifier {
  /// State fields for stateful widgets in this page.
  final unfocusNode = FocusNode();

  // Model for appbar component.
  late AppbarModel appbarModel;

  EssencesModel() {
    appbarModel = AppbarModel();
  }

  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
  }
}
