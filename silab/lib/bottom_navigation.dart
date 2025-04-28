import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/assets/primary_colors.dart';
import 'package:silab/components/menu_item.dart';
import 'package:silab/providers/navigation_provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: 500,
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            childAspectRatio: 16/9,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              MenuItem("assets/icons/people.png", "Pegawai", 3),
              // MenuItem("assets/icons/settings.png", "Role", 4),
              // MenuItem("assets/icons/permissions.png", "Permission", 5),
              MenuItem("assets/icons/department.png", "Jurusan", 6),
              MenuItem("assets/icons/study-programs.png", "Program Studi", 7),
              // MenuItem("assets/icons/unit.png", "Satuan", 8),
              MenuItem("assets/icons/items.png", "Barang", 9),
              MenuItem("assets/icons/labs.png", "Laboratorium", 10),
              MenuItem("assets/icons/labs.png", "Peminjaman", 10),
              // MenuItem("assets/icons/labs.png", "Login", 11),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(
        color: PrimaryColors.teal
      ),
      currentIndex: navigationProvider.selectedIndex == 0 || navigationProvider.selectedIndex == 2?  navigationProvider.selectedIndex : 1,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.space_dashboard_rounded), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu', ),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: 'Akun'),
      ],
      onTap: (value) {
        setState(() {
          if (value == 1) {
            _showModalBottomSheet();
          } else {
            navigationProvider.setSelectedIndex(value);
          }
        });
      },
    );
  }
}