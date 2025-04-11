import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget? child;
  const BorderedContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: child
    );
  }
}