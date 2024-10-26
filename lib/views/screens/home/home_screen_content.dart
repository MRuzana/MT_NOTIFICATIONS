import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';
import 'package:machine_test_notifications/views/widgets/craze_deals.dart';
import 'package:machine_test_notifications/views/widgets/location_widget.dart';
import 'package:machine_test_notifications/views/widgets/near_stores.dart';
import 'package:machine_test_notifications/views/widgets/search_widget.dart';
import 'package:machine_test_notifications/views/widgets/todays_likes.dart';
import 'package:machine_test_notifications/views/widgets/top_picks.dart';
import 'package:machine_test_notifications/views/widgets/trending.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(125), child: _appBar(context)),
      body: SafeArea(
        child: ListView(
          children: const [
            kHeight10,
            TodaysLikes(),
            TopPicks(),
            Trending(),
            CrazeDeals(),
            NearStores(),
            AllStoreButton(),
            kHeight10,
          ],
        ),
      ),
    );
  }
}

class AllStoreButton extends StatelessWidget {
  const AllStoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding15,
      child: Center(
        child: Container(
          height: 40,
          width: 240,
          decoration: BoxDecoration(
              color: const Color(0xFF29D177),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text('View all stores',
                style: customTextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}

Widget _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    flexibleSpace: SafeArea(
      child: Padding(
        padding: padding15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLocationWidget(),
            kHeight20,
            buildSearchWidget(context),
          ],
        ),
      ),
    ),
  );
}
