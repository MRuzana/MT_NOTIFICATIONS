import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/services/api_services.dart';
import 'package:machine_test_notifications/model/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> notificationList = [];
  bool isLoading = true;

  NotificationProvider() {
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    isLoading = true;
    notifyListeners();
    try{
      notificationList = await ApiService().fetchNotifications();
      
    }
    catch(e){
      log('Error fetching notifications: $e');
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }
}