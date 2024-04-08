import 'package:flutter/material.dart';

import '../pages/menu.dart';

class MenuModel extends ChangeNotifier {
  // State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}
