import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/HomeController.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';

class ListViewHome extends StatelessWidget {
  ListViewHome({Key? key}) : super(key: key);


  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420,
      child: ListView.separated(
        itemCount: 6,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 12,right: 12),
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child:Row(
                    children: [
                      Image.asset(
                        controller.images[index],
                        height: 50,
                        // color: ColorStyle,
                      ),
                      SizedBox(
                        width:2,
                      ),
                      Container(
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                controller.sendReceive[index],
                                style: TextStylesProductSans.textStyles_16),
                            Text(
                                '15/2/2022   10:56 AM ',
                                style: TextStylesProductSans.textStyles_14.apply(
                                    color: ColorStyle.grey
                                )),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                    controller.text[index],
                    style: TextStylesProductSans.textStyles_18),
              ],
            ),
          );
        },
      ),
      decoration: BoxDecoration(
        color: ColorStyle.white,
      ),
    );
  }
}
