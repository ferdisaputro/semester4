import 'package:flutter/material.dart';
import 'package:mockup_ki/primary_colors.dart';
import 'package:mockup_ki/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class OutlineButtonRedirect extends StatelessWidget {
  final String text;
  final int? index;

  const OutlineButtonRedirect(this.text, {this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: OutlinedButton(
        onPressed: () {
          index != null? context.read<NavigationProvider>().setIndex(index) : false;
        }, 
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: PrimaryColors.blue,
            width: 1,
          ), 
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        child: Text(
          softWrap: false,
          style: TextStyle(
            fontSize: 13,
            color: PrimaryColors.blue,
            fontWeight: FontWeight.bold
          ),
          text
        ),
      ),
    );
  }
}