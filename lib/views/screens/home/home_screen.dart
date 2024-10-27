import 'package:flutter/material.dart';
import 'package:machine_test_notifications/controller/bottom_nav_provider.dart';
import 'package:machine_test_notifications/core/utils/connection_checker.dart';
import 'package:machine_test_notifications/views/screens/account.dart';
import 'package:machine_test_notifications/views/screens/cart.dart';
import 'package:machine_test_notifications/views/screens/home/home_screen_content.dart';
import 'package:machine_test_notifications/views/screens/my_order.dart';
import 'package:machine_test_notifications/views/widgets/nav_items.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isConnected = true;

 @override
  void initState() {
    super.initState();
    ConnectionChecker.listenForConnectionChanges(context);
  }
  @override
  void dispose() {
    ConnectionChecker.cancelConnectionSubscription();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Consumer<BottomNavProvider>(builder: (context, provider, child) {
        if (!isConnected) {
          return const Center(child: Text('No internet connection'));
        }

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
      }),
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
}


