import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silab/config/primary_colors.dart';
import 'package:silab/providers/navigation_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required Color backgroundColor, required int elevation, required AnimatedAlign title});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<NavigationProvider>().selectedIndex;

    return Container(
      decoration: BoxDecoration(
        color: PrimaryColors.teal,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AnimatedAlign(
          alignment: selectedIndex == 0
              ? Alignment.center
              : Alignment.center,
          duration: const Duration(milliseconds: 150),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('assets/silab.png'),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
