import 'package:flutter/material.dart';

class NavItems extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const NavItems({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 12,
      selectedFontSize: 12,
     // selectedLabelStyle: const TextStyle(color: Color(0xFF29D177),),
      selectedItemColor: const Color(0xFF29D177),
      unselectedItemColor: const Color(0xFF7D7D7D),
      selectedIconTheme: const IconThemeData(
        color: Color(0xFF29D177),
      ),
      unselectedIconTheme: const IconThemeData(
        color:  Color(0xFF7D7D7D),
      ),
      onTap: onTap,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('assets/home.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('assets/cart.png')),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('assets/myorder.png')),
          label: 'My Order',
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage('assets/account.png')),
          label: 'Account',
        ),
      ],
    );
  }
}
