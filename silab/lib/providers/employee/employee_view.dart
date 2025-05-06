// employee_view.dart
import 'package:flutter/material.dart';
import 'package:silab/providers/appbar.dart';
import 'package:silab/providers/bottom_navigation.dart';
import 'employee_content.dart';

class EmployeeView extends StatelessWidget {
  const EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const CustomAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AnimatedAlign(
          alignment: Alignment.center,
          duration: Duration(milliseconds: 150),
          child: SizedBox(), // Kosong, karena title dikelola di dalam CustomAppBar
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      // bottomNavigationBar: BottomNavigation(),
      body: EmployeeContent(),
    );
  }
}
