import 'package:flutter/material.dart';
import 'package:mockup_ki/components/icon_with_label.dart';

class BuildServiceIcons extends StatelessWidget {
  const BuildServiceIcons({super.key});

  // List<Map<String, dynamic>> categories = [
  //   {"icon": LucideIcons.train, "label": "Antar Kota", "color1": Color(0xFF3A5ADF), "color2": Color(0xFF6C8DF7)}, // Biru gradasi
  //   {"icon": LucideIcons.train, "label": "Lokal", "color1": Color(0xFFF58529), "color2": Color(0xFFFEDA77)}, // Orange gradasi
  //   {"icon": LucideIcons.train, "label": "Commuter Line", "color1": Color(0xFFD31A50), "color2": Color(0xFFF4511E)}, // Merah gradasi
  //   {"icon": LucideIcons.train, "label": "LRT", "color1": Color(0xFFAA00FF), "color2": Color(0xFFE040FB)}, // Ungu gradasi
  //   {"icon": LucideIcons.train, "label": "Bandara", "color1": Color(0xFF0091EA), "color2": Color(0xFF40C4FF)}, // Biru langit gradasi
  //   {"icon": LucideIcons.flashlight, "label": "Whoosh", "color1": Color(0xFFB71C1C), "color2": Color(0xFFD32F2F)}, // Merah pekat gradasi
  // ];

  static const List<Map<String, dynamic>> services = [
    {"icon": Icons.train, "label": "Antar Kota", "color1": Color(0xFF3A5ADF), "color2": Color(0xFF6C8DF7)},
    {"icon": Icons.directions_subway, "label": "Lokal", "color1": Color(0xFFF58529), "color2": Color(0xFFFEDA77)},
    {"icon": Icons.tram, "label": "Commuter Line", "color1": Color(0xFFD31A50), "color2": Color(0xFFF4511E)},
    {"icon": Icons.directions_railway, "label": "LRT", "color1": Color(0xFFAA00FF), "color2": Color(0xFFE040FB)},
    {"icon": Icons.flight, "label": "Bandara", "color1": Color(0xFF0091EA), "color2": Color(0xFF40C4FF)},
    {"icon": Icons.double_arrow_rounded, "label": "Whoosh", "color1": Color(0xFFB71C1C), "color2": Color(0xFFD32F2F)},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 15,
            children: services.map((service) => IconWithLabel(service['icon'], service['label'], color1: service['color1'], color2: service['color2'] )).toList(),
          ),
        ),
      ),
    );
  }
}