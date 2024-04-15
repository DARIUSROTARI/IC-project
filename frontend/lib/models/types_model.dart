import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/appbar.dart';
import '../pages/types.dart';

class TypesModel extends ChangeNotifier {
  final unfocusNode = FocusNode();
  late AppbarModel appbarModel;

  void initState(BuildContext context) {
    appbarModel = AppbarModel();
  }

  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
  }
}
