import 'package:flutter/material.dart';
import 'package:silab/widgets/centered_stat_text.dart';

class CenteredStatCard extends StatelessWidget {
  final List<CenteredStatText> children;
  final List<Color> gradientColors;
  final bool withShadow;
  const CenteredStatCard({super.key, required this.children, required this.gradientColors, this.withShadow = true});

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
        boxShadow: withShadow? [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ] : [],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = children.length;
          double spacing = 10;
          double itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: children.map((child) {
              return SizedBox(
                width: itemWidth,
                child: child,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}