import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/providers/navigation_provider.dart';

class MenuItem extends StatelessWidget {
  final String iconSrc;
  final String text;
  final int index;

  const MenuItem(this.iconSrc, this.text, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        context.read<NavigationProvider>().setSelectedIndex(index),
        Navigator.pop(context)
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black26
            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconSrc),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}