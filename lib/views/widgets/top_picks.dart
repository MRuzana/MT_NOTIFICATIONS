import 'package:flutter/material.dart';
import 'package:machine_test_notifications/core/constatnts/width_height.dart';
import 'package:machine_test_notifications/views/styles/text_style.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingL15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top picks for you',
            style: customTextStyle(
              fontSize: 20,
              color: const Color(0xFF323232),
              fontWeight: FontWeight.w700,
            ),
          ),
          kHeight20,
          topPicksListview(),
          
        ],
      ),
    );
  }
}



Widget topPicksListview(){
  return SizedBox(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (conntext,index){
        return Padding(
          padding: paddingR5,
          child: Image.asset('assets/top_picks.png',fit:BoxFit.cover, width: 374,height: 200,),
        );
      }
    ),
  );
}
