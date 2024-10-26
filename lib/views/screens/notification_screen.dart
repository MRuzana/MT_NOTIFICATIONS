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

  if (difference.inDays > 365) {
    int years = (difference.inDays / 365).floor();
    return '$years year${years > 1 ? 's' : ''} ago';
  } else if (difference.inDays > 30) {
    int months = (difference.inDays / 30).floor();
    return '$months month${months > 1 ? 's' : ''} ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else {
    return 'Just now';
  }
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