import 'package:flutter/material.dart';
import 'package:mockup_ki/components/aditional_services/hotel.dart';
import 'package:mockup_ki/components/aditional_services/logistic_express.dart';
import 'package:mockup_ki/components/aditional_services/multi_trip_card.dart';
import 'package:mockup_ki/components/services/icon_with_label.dart';

class AdditionalServices extends StatelessWidget {
  const AdditionalServices({super.key});

  static List<Map<String, dynamic>> services = [
    {"icon": Icons.apartment_rounded, "label": "Hotel", "service": Hotel()},
    {"icon": Icons.emoji_transportation_rounded, "label": "Kartu Multi Trip", "service": MultiTripCard()},
    {"icon": Icons.cases_rounded, "label": "KAI Logistik", "service": LogisticExpress()},
    {"icon": Icons.more_horiz_rounded, "label": "Show More"},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: services.map((service) => IconWithLabel(service['icon'], service['label'], redirectPage: service['service'])).toList(),
    );
  }
}