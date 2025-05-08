import 'package:flutter/material.dart';
import 'laboratory_content.dart';

class LaboratoryView extends StatelessWidget {
  const LaboratoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LaboratoryContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
