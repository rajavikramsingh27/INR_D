import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:inr_d/Views/SendTo.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Profile",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: Colors.grey)),
              Image.asset(
                ImageStyle.dropdoun,
                width: 14,
                // controller.images[index],
                height: 28,),

            ],
          ),
          SizedBox(height: 14,),
          Container(
            height: 50,
            // width: 139,
            padding: EffectStyle.padding(10, 0, 0, 0),
            child: TextField (
              decoration: InputDecoration(

                  border: InputBorder.none,

                  hintText: ' Full Name'
              ),
            ),
            decoration: BoxDecoration(
                color: ColorStyle.hex('F3E8E8'),

                borderRadius: BorderRadius.circular(6)
            ),
          ),
          SizedBox(height: 14,),
          Container(
            height: 50,
            // width: 139,
            padding: EffectStyle.padding(10, 0, 0, 0),
            child: TextField (
              decoration: InputDecoration(

                  border: InputBorder.none,

                  hintText: 'Email'
              ),
            ),
            decoration: BoxDecoration(
                color: ColorStyle.hex('F3E8E8'),

                borderRadius: BorderRadius.circular(6)
            ),
          ),
          SizedBox(height: 14,),
          Container(
            height: 100,
            // width: 139,
            padding: EffectStyle.padding(10, 0, 0, 0),
            child: TextField (
              decoration: InputDecoration(

                  border: InputBorder.none,

                  hintText: '  Address'
              ),
            ),
            decoration: BoxDecoration(
                color: ColorStyle.hex('F3E8E8'),

                borderRadius: BorderRadius.circular(6)
            ),
          ),
          SizedBox(height: 14,),
          TextButtonCustom(
            text: ' Save',
            colorBG: ColorStyle.primaryColor,
            width: MediaQuery.of(context).size.width-60,
            textStyle: TextStylesProductSans.textStyles_16.apply(
                color: Colors.white
            ),
            onTap: () {
              Get.to(SendTo());
            },
          )
        ],
      ),
    );
  }
}
