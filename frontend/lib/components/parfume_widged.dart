import 'package:flutter/material.dart';
import 'Parfum.dart';

class ParfumCard extends StatelessWidget {
  final Parfum parfum;

  ParfumCard({required this.parfum});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFCAF0F8), // Setăm culoarea cardului
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   parfum.id as String,
            //   style: TextStyle(
            //     fontSize: 16,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            Text(
              parfum.type,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              parfum.category,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              parfum.quantity,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
               "\$" + parfum.price.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}