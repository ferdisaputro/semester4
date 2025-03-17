import 'package:flutter/material.dart';
import 'package:mockup_ki/primary_colors.dart';

class IconWithLabel extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color1;
  final Color? color2;

  const IconWithLabel(this.icon, this.label, {this.color1, this.color2, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 65,
      ),
      child: Column(
        spacing: 5,
        children: [
          IconButton(
            onPressed: () {},
            constraints: BoxConstraints(
              maxWidth: 55,
            ),
            style: IconButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            icon: AspectRatio(
              aspectRatio: 1/1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: color1 != null && color2 != null? [color1!, color2!] : [PrimaryColors.blue.withAlpha(20), PrimaryColors.blue.withAlpha(20)],
                  )
                ), 
                child: Icon(
                  icon, 
                  size: 30, 
                  color: color1 != null && color2 != null? Colors.white : PrimaryColors.blue
                ),
              ),
            ),
          ),
          Text(
            label, 
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            )
          ),
        ],
      ),
    );
  }
}