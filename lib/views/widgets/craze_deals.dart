import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';


class CrazeDeals extends StatelessWidget {
  const CrazeDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingL15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight20 ,
          Text('Craze deals',
            style: customTextStyle(
              fontSize: 20,
              color: const Color(0xFF323232),
              fontWeight: FontWeight.w700,
            ),
          ),
          crazeDealsListview(),
          kHeight15,
          Padding(
            padding: paddingR15,
            child: Center(child: Image.asset('assets/coupon.png',fit:BoxFit.cover, width: double.infinity,height: 88,)),
          ),

          
        ],
      ),
    );
  }
}



Widget crazeDealsListview(){
  return SizedBox(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (conntext,index){
        return Padding(
          padding: paddingR5,
          child: Image.asset('assets/craze.png',fit:BoxFit.cover, width: 374,height: 160,),
        );
      }
    ),
  );
}