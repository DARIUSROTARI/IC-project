import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';
import '../pages/main_page.dart';
import '../models/appbar_model.dart';

class MainpageModel extends ChangeNotifier {
  final FocusNode unfocusNode = FocusNode();
  late AppbarModel appbarModel;

  void initState(BuildContext context) {
    appbarModel = AppbarModel();
  }

  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
  }
}
