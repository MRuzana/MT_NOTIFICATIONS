import 'package:flutter/material.dart';
import 'package:machine_test_notifications/controller/bottom_nav_provider.dart';
import 'package:machine_test_notifications/controller/notification_provider.dart';
import 'package:machine_test_notifications/routes/routes.dart';
import 'package:machine_test_notifications/views/screens/home/home_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
     
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: Routes.routes,
          home: const HomeScreen()),
    );
  }
}
