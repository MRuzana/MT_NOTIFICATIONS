import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';

class NearStores extends StatelessWidget {
  const NearStores({super.key});

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
                'Nearby stores',
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
          nearByStoreListView(),
        ],
      ),
    );
  }
}

Widget nearByStoreListView() {
  return SizedBox(
    width: double.infinity,
    child: Center(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: padding8,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/nearby.png',
                      fit: BoxFit.contain,
                      width: 72,
                      height: 80,
                    ),
                    kWidth10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         // kHeight13,
                          Text(
                            'Freshly Baker',
                            style: customTextStyle(
                              fontSize: 18,
                              color: const Color(0xFF323232),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Sweets, North Indian',
                            style: customTextStyle(
                              fontSize: 14,
                              color: const Color(0xFF474747),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Site No - 1  |  6.4 kms',
                            style: customTextStyle(
                              fontSize: 12,
                              color: const Color(0xFF474747),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 233, 233),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Padding(
                                padding: padding3,
                                child: Text(
                                  'Top Store',
                                  style: custom1TextStyle(
                                    fontSize: 8,
                                    color: const Color(0xFF505050),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: paddingR20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xFF505050),
                                size: 12,
                              ),
                              Text(
                                ' 4.1',
                                style: customTextStyle(
                                  fontSize: 16,
                                  color: const Color(0xFF505050),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '45 mins',
                            style: customTextStyle(
                              fontSize: 18,
                              color: const Color(0xFFEA7E00),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: paddingL75, 
                  child: Divider(
                    color: Color(0xFFDEDEDE),
                    thickness: 1,
                    
                  ),
                ),
                Padding(
                  padding: paddingL75,
                  child: Row(
                    children: [
                       Image.asset('assets/discount.png',fit: BoxFit.cover,),
                      Text(' Upto 10% OFF ', style: customTextStyle(
                        fontSize: 12,
                        color: const Color(0xFF323232),
                        fontWeight: FontWeight.w700,
                      ),),
                      Image.asset('assets/grocery.png',fit: BoxFit.cover,),
                      Text(' 3400+ items available ', style: customTextStyle(
                        fontSize: 12,
                        color: const Color(0xFF323232),
                        fontWeight: FontWeight.w700,
                      ),),
                    ],
                  ),
                ),
                kHeight20,
              ],
            ),
          );
        },
      ),
    ),
  );
}



