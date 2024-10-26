import 'package:flutter/material.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';

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
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              '',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            title: Text(
              '',
              style: customTextStyle(
                fontSize: 18,
                color: const Color(0xFF323232),
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '',
                  style: customTextStyle(
                    fontSize: 14,
                    color: const Color(0xFF474747),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '',
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
