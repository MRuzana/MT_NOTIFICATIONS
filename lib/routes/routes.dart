import 'package:flutter/material.dart';
import 'package:machine_test_notifications/views/screens/home/home_screen.dart';

class Routes{

  static final Map<String, WidgetBuilder> routes = {
    
    '/home':(context) => const HomeScreen(),
    // '/notifications':(context)=> const NotificationScreen(), 
  };
}