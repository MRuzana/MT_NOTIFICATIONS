import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test_notifications/core/constatnts/api_endpoint.dart';
import 'package:machine_test_notifications/model/notification_model.dart';

class ApiService {
  Future<List<NotificationModel>> fetchNotifications()async{

    final response = await http.get(Uri.parse(ApiEndpoints.notificationEndPoint));
    if(response.statusCode==200){
      final data = json.decode(response.body) as Map<String, dynamic>;
      List<dynamic> notificationsData = data['data'];
      final notificationList = notificationsData.map((item) => NotificationModel.fromJson(item)).toList();
      return notificationList;
    }
    else{
      throw Exception('Failed to load notifications');
    }
    
  }
}