import 'package:flutter/material.dart';
import 'package:mockup_ki/components/banner/title_inside.dart';
import 'package:mockup_ki/components/build_service_icons.dart';

class TrainPage extends StatelessWidget {
  const TrainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                  ),
                  "Kereta",
                ), 
                Text(
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  "Layanan Kereta dari KAI",
                ),
              ],
            ),
          ),
          BuildServiceIcons(),
          Expanded(
            child: _popularDestinationBanner(),
          ),
        ]
      ),
    );
  }

  Widget _popularDestinationBanner() {
    final destinations = [
      {'image': 'assets/images/jakarta.png', 'title': 'Jakarta'},
      {'image': 'assets/images/bandung.jpg', 'title': 'Bandung'},
      {'image': 'assets/images/jogjakarta.jpg', 'title': 'Jogjakarta'},
      {'image': 'assets/images/semarang.jpg', 'title': 'Semarang'},
      {'image': 'assets/images/surabaya.jpg', 'title': 'Surabaya'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            'Tujuan Populer'
          ),
        ),
        Expanded(
          child: SingleChildScrollView (
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              spacing: 15,
              children: destinations.map((destination) => TitleInside(destination['image']!, destination['title']!, aspectRatio: 16/7,)).toList(),
            ),
          ),
        )
      ],
    );
  }
}