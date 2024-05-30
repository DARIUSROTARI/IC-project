import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proiect_ic/components/Parfum.dart';
import 'package:proiect_ic/components/parfume_widged.dart';
import 'package:proiect_ic/pages/place_order.dart';
import 'package:proiect_ic/services/parfum_service.dart';

import '../services/helper.dart'; // Import the service

class ViewCartWidget extends StatefulWidget {
  ViewCartWidget();

  @override
  _ViewCartWidgetState createState() => _ViewCartWidgetState();
}

class _ViewCartWidgetState extends State<ViewCartWidget> {
  List<Parfum> parfumes = [];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  Parfum? selectedParfum;

  @override
  void initState() {
    super.initState();
    _fetchCartItems(); // Fetch initial cart items

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoading) {
        _fetchCartItems(); // Fetch more data when the end of the list is reached
      }
    });
  }

  Future<void> _fetchCartItems() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Parfum>? newParfumes = await ParfumService.getCart();
      setState(() {
        if (newParfumes != null) {
          parfumes.addAll(newParfumes);
        }
      });
    } catch (e) {
      print('Error fetching cart items: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _removeSelectedParfum() {
    setState(() {
      parfumes.remove(selectedParfum);
      selectedParfum = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 70.0), // Adjust the height as needed
        child: Padding(
          padding: EdgeInsets.only(top: 70.0,bottom:20), // Adjust the padding as needed
          child:AppBar(
            title: Text('Cart',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: parfumes.length + (isLoading ? 1 : 0),
                itemBuilder: (BuildContext context, int index) {
                  if (index == parfumes.length) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final parfum = parfumes[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedParfum = parfum;
                      });
                    },
                    child: Container(
                      color: selectedParfum == parfum ? Colors.grey[300] : Colors.transparent,
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ParfumCard(parfum: parfum),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: selectedParfum == null
                  ? null
                  : () {
                // Place order logic here
                print('Order placed for: ${selectedParfum!.id}');
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderFormPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                textStyle: TextStyle(fontSize: 14),
              ),
              child: Text('Place Order',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: selectedParfum == null
                  ? null
                  : () {
                // Place order logic here
                Helper.setParfumId(selectedParfum!.id);
                ParfumService.removeFromCart();
                _removeSelectedParfum();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                textStyle: TextStyle(fontSize: 14),
              ),
              child: Text('Remove',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
