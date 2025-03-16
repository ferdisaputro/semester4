import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xFF4FD1C5), // Warna header (sesuaikan jika berbeda)
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'assets/silab.png',  // Gantilah dengan gambar logo Anda
          height: 40,               // Sesuaikan ukuran logo
        ),
      ),
    );
  }
}
