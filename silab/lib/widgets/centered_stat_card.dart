import 'package:flutter/material.dart';
import 'package:silab/widgets/centered_stat_text.dart';

class CenteredStatCard extends StatelessWidget {
  final List<CenteredStatText> children;
  final List<Color> gradientColors;
  const CenteredStatCard({super.key, required this.children, required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: GridView.count(
        crossAxisCount: children.length,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        children: children,
      ),
    );
  }
}