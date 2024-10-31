import 'dart:convert';
import 'dart:isolate';
import 'package:http/http.dart' as http;
import 'package:machine_test_notifications/core/constatnts/api_endpoint.dart';
import 'package:machine_test_notifications/model/notification_model.dart';

class ApiService {
  Future<List<NotificationModel>> fetchNotifications()async{

     // Create a ReceivePort to receive messages from the isolate
    final receivePort = ReceivePort();
    
    // Spawn an isolate and pass the receive port's send port
    await Isolate.spawn(_fetchNotificationsInIsolate, receivePort.sendPort);
    
    // Wait for the isolate to send back the notification data
    final notificationData = await receivePort.first as List<NotificationModel>;
    
    return notificationData;
}

static Future<void> _fetchNotificationsInIsolate(SendPort sendPort) async {
    try {
      // Fetch notifications data
      final response = await http.get(Uri.parse(ApiEndpoints.notificationEndPoint));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        List<dynamic> notificationsData = data['data'];
        
        // Map the notification data to NotificationModel objects
        final notificationList = notificationsData.map((item) => NotificationModel.fromJson(item)).toList();
        
        // Send the notifications list back to the main isolate
        sendPort.send(notificationList);
      } else {
        // Send an error message back if the request failed
        sendPort.send(Exception('Failed to load notifications'));
      }
    } catch (error) {
      // Handle any error and send back
      sendPort.send(error);
    }
  }

}


// class ApiService {
//   Future<List<NotificationModel>> fetchNotifications()async{

//     final response = await http.get(Uri.parse(ApiEndpoints.notificationEndPoint));
//     if(response.statusCode==200){
//       final data = json.decode(response.body) as Map<String, dynamic>;
//       List<dynamic> notificationsData = data['data'];
//       final notificationList = notificationsData.map((item) => NotificationModel.fromJson(item)).toList();
//       return notificationList;
//     }
//     else{
//       throw Exception('Failed to load notifications');
//     }
    
//   }
// }