import 'package:flutter/material.dart';
import 'package:proiect_ic/pages/main_page.dart';

import '../models/menu_model.dart';
export '../models/menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
      _model = MenuModel();
      _model.initState(context);

  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_model.unfocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(_model.unfocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey, // You can replace this with your desired color
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              buildMenuItem('Category'),
              buildMenuItem('Types'),
              buildMenuItem('Essences'),
              buildMenuItem('Perfume quantity'),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 70, 170, 0),
                child: Container(
                  width: 134,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.blue, // You can replace this with your desired color
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black, // You can replace this with your desired color
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                      onPressed: ()  {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => MainpageWidget()),);
                       },
                      child:Text(
                        ' <  Back to About us ',
                        style: TextStyle(
                          fontFamily: 'Playfair Display',
                          color: Colors.white, // You can replace this with your desired color
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey, // You can replace this with your desired color
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black, // You can replace this with your desired color
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
