import 'package:flutter/material.dart';
import 'package:mockup_ki/primary_colors.dart';

class Hotel extends StatelessWidget {
  const Hotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
            children: [
              _background(),
              SafeArea(
                child: Positioned(
                  child: Column(
                    spacing: 15,
                    children: [
                      _appBar(),
                      _hotelOrder(),
                    ],
                  ),
                ),
              )
            ],
        )
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Center(
            child: Text(
              "Pesan Hotel",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20
              ),
            ),
          )
        ]
      ),
    );
  }

  Widget _background() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PrimaryColors.lightPurple,
            PrimaryColors.blue,
            PrimaryColors.lightPurple.withAlpha(220),
            Colors.deepOrangeAccent
          ],
          stops: [
            0.0, 0.4, 0.8, 1.0
          ]
        ),
      ),
    );
  }

  Widget _hotelOrder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 15,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pesan Hotel",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    "Pesan hotel sekarang untuk kenyamanan perjalanan Anda",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              _form(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: Text('Cari Hotel'),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _form() {
    return Column(
      spacing: 15,
      children: [
        buildInputTile(Icons.location_on, "Pilih Lokasi"),
        Row(
          children: [
            Expanded(child: buildInputTile(null, "Jum, 11 Apr 2025")),
            SizedBox(width: 12),
            Expanded(child: buildInputTile(null, "1 Malam")),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Check-out : Sab, 12 Apr 2025    Maks. 15 malam",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        buildInputTile(null, "1 Kamar, 1 Dewasa, 0 Anak"),
        buildInputTile(Icons.filter_alt, "Filter"),
      ],
    );
  }

  Widget buildInputTile(IconData? icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (icon != null) Icon(icon, color: Colors.blue),
          if (icon != null) SizedBox(width: 10),
          Expanded(
            child: Text(
              softWrap: false,
              text,
            )
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }
}