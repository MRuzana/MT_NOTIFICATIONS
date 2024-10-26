import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';


class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingL15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight20, 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: customTextStyle(
                  fontSize: 22,
                  color: const Color(0xFF323232),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: paddingR15,
                child: Text(
                  'See all',
                  style: customTextStyle(
                    fontSize: 16,
                    color: const Color(0xFF06C25E),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          //kHeight15,
          trendingGridView(),
        ],
      ),
    );
  }
}


Widget trendingGridView() {
  return SizedBox(
    height: 220,
    width: double.infinity,
    child: Center(
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 25.0,
          childAspectRatio: 1 / 2.3,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Center(
            // Center each grid item horizontally
            child: Row(
             
              children: [
                Image.asset(
                  'assets/trending.png',
                  fit: BoxFit.contain,
                  width: 80,
                  height: 88,
                ),
                kWidth10,
                Expanded(
                  child: Column(
                  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight13,
                      Text('Mithas Bhandar',
                      style: customTextStyle(
                        fontSize: 18, 
                        color: const Color(0xFF323232), 
                        fontWeight: FontWeight.w700),
                      ),
                      Text('Sweets, North Indian',
                      style: customTextStyle(
                        fontSize: 12, 
                        color: const Color(0xFF474747), 
                        fontWeight: FontWeight.w500),
                      ),
                      Text('(store location) | 6.4 kms',
                        style: customTextStyle(
                        fontSize: 12, 
                        color: const Color(0xFF474747), 
                        fontWeight: FontWeight.w500),
                      ),
                      Text('★ 4.1 | 45 mins',
                      style: customTextStyle(
                        fontSize: 14, 
                        color: const Color(0xFF474747), 
                        fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    ),
  );
}
