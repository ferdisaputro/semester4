import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dashboard.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardScreen(), // Beranda
    const Center(child: Text("Kereta", style: TextStyle(fontSize: 20))),
    const Center(child: Text("Tiket Saya", style: TextStyle(fontSize: 20))),
    const Center(child: Text("Promo", style: TextStyle(fontSize: 20))),
    const Center(child: Text("Akun", style: TextStyle(fontSize: 20))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.train), label: "Kereta"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.ticket), label: "Tiket Saya"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.percent), label: "Promo"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: "Akun"),
        ],
      ),
    );
  }
}
