import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Parfum.dart';

class ParfumCard extends StatelessWidget {
  final Parfum parfum;

  ParfumCard({required this.parfum});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade100, // Setăm culoarea cardului
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              parfum.type,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,

                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              parfum.category,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,

                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              parfum.quantity,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,

                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
               "\$" + parfum.price.toString(),
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,

                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}