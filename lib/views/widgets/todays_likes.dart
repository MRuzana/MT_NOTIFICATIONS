import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';

class TodaysLikes extends StatelessWidget {
  const TodaysLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8,
      child: Column(
        children: [
          Text(
            'What would you like to do today?',
            style: customTextStyle(
              fontSize: 22,
              color: const Color(0xFF323232),
              fontWeight: FontWeight.w700,
            ),
          ),
          kHeight20,
          categoryGridView(),
          kHeight20,
          moreButton(),
        ],
      ),
    );
  }
}

Widget categoryGridView() {
  final List<String> categoryImages = [
    "assets/food_delivery.png",
    "assets/medicine.png",
    "assets/pet.png",
    "assets/gifts.png",
    "assets/meat.png",
    "assets/cosmetic.png",
    "assets/stationery.png",
    "assets/stores.png"
  ];

  final List<String> categoryList = [
    'Food Delivery',
    'Medicines',
    'Pet Supplies',
    'Gifts',
    'Meat',
    'Cosmetic',
    'Stationery',
    'Stores'
  ];
  return SizedBox(
    
    height: 220  ,
    width: double.infinity,
    child: Center(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 30.0,
          childAspectRatio: 1.0,
        ),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {

          return Center( // Center each grid item horizontally
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
              children: [
                Image.asset(
                  categoryImages[index],
                  fit: BoxFit.contain,
                  width: 70,
                  height: 70,
                ),
                const SizedBox(height: 5),
                Flexible(
                  child: Center(
                    child: Text(
                      categoryList[index],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: customTextStyle(
                        fontSize: 12,
                        color: const Color(0xFF323232),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

Widget moreButton(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('More',style: customTextStyle(
        fontSize: 15, 
        color: const Color(0xFF29D177),
        fontWeight: FontWeight.w700
      ),),
      kWidth5,
      Image.asset('assets/down_arrow.png'),
    ],
  );
}