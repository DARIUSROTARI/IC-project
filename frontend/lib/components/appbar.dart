import 'package:flutter/material.dart';
import 'package:proiect_ic/pages/cart.dart';
import 'package:proiect_ic/pages/favorite.dart';
import 'package:proiect_ic/pages/profile.dart';
import 'package:provider/provider.dart';

import '../models/appbar_model.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  late AppbarModel _model;

  @override
  void initState() {
    super.initState();
    _model = AppbarModel();
  }


  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 250),
            child: GestureDetector(
              onTap: () {
                // Add your navigation logic here
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewFavoriteRecipesWidget()));
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  // color: Colors.grey,
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/images.png',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Add your navigation logic here
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewCartWidget()));
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  // color: Colors.grey,
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/online-shop-icon-vector.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                // Add your navigation logic here
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  // color: Colors.grey,
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/user.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
