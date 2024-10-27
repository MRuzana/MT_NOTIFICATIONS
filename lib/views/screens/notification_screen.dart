import 'package:flutter/material.dart';
import 'package:machine_test_notifications/controller/notification_provider.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80), child: _appBar(context)),
      body: const SafeArea(
        child: NotificationListview(),
      ),
    );
  }
}

class NotificationListview extends StatelessWidget {
  const NotificationListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.notificationList.isEmpty) {
          return const Center(child: Text('No notifications available'));
        } else {
          return ListView.separated(
            separatorBuilder: (context,index){
              return const Divider();
            },
              itemCount: provider.notificationList.length,
              itemBuilder: (context, index) {
                final notifications = provider.notificationList[index];
                return ListTile(
                  leading: Image.asset('assets/${notifications.image}',
                  width: 30,
                  height: 30 ,
                  fit: BoxFit.cover,),
                  title: Text(notifications.title,
                    style: customTextStyle(
                      fontSize: 18,
                      color: const Color(0xFF323232),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notifications.body,
                        style: customTextStyle(
                          fontSize: 14,
                          color: const Color(0xFF474747),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text( timeAgo(notifications.timestamp)  ,
                        style: customTextStyle(
                          fontSize: 12,
                          color: const Color(0xFF727272),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
      },
    );
  }
}

String timeAgo(String timestamp) {
  // Parse the timestamp string into a DateTime object
  DateTime notificationTime = DateTime.parse(timestamp);
  DateTime now = DateTime.now();

  Duration difference = now.difference(notificationTime);

  // Return the number of days ago
  int days = difference.inDays;

  // Ensure it returns a string indicating the number of days
  return days > 0 ? '$days day${days > 1 ? 's' : ''} ago' : 'Just now';
}



Widget _appBar(BuildContext context) {
  return Column(
    children: [
      AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: customTextStyle(
            fontSize: 20,
            color: const Color(0xFF323232),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/notification_back.png')),
      ),
      const Divider(),
    ],
  );
}