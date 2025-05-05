import 'package:flutter/material.dart';

class CenteredStatText extends StatelessWidget {
  final String label;
  final String value;
  const CenteredStatText(this.value, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 30, 
            fontWeight: 
            FontWeight.bold, 
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 16, 
            color: Colors.white70
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}