import 'package:flutter/material.dart';
import 'package:machine_test_notifications/controller/bottom_nav_provider.dart';
import 'package:machine_test_notifications/views/screens/account.dart';
import 'package:machine_test_notifications/views/screens/cart.dart';
import 'package:machine_test_notifications/views/screens/home/home_screen_content.dart';
import 'package:machine_test_notifications/views/screens/my_order.dart';
import 'package:machine_test_notifications/views/widgets/nav_items.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNav()
    );
  }
}

Widget _body() {
  return SafeArea(
    child: Consumer<BottomNavProvider>(
      builder: (context, provider, child) {
        switch (provider.selectedIndex) {
          case 0:
            return const HomeScreenContent();
          case 1:
            return const Cart();
          case 2:
            return const MyOrder();
          case 3:
            return const Account();
          default:
            return const HomeScreenContent();
        }
      },
    ),
  );
}

Widget _bottomNav() {
  return Consumer<BottomNavProvider>(builder: (context, provider, child) {
    return NavItems(
      currentIndex: provider.selectedIndex,
      onTap: (index) {
        provider.updateIndex(index);
      },
    );
  });
}
