import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mockup_ki/dashboard.dart';
import 'package:mockup_ki/primary_colors.dart';
import 'package:mockup_ki/train_page.dart';
import 'package:mockup_ki/promo_screen.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    Dashboard(),
    TrainPage(),
    Center(
      child: Text("Tiket Saya"),
    ),
    PromoScreen(),
    Center(
      child: Text("Akun"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.white
        ), 
        child: BottomNavigationBar(
          selectedItemColor: PrimaryColors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.red,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
            BottomNavigationBarItem(icon: Icon(Icons.train), label: "Kereta"),
            BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: "Tiket Saya"),
            BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Promo"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            Logger().d(_selectedIndex);
          },
        ),
      ),
    );
  }
}