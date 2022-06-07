import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inr_d/Controllers/SettingsController.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/EffectStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';

class HelpScreen extends StatelessWidget {
   HelpScreen({Key? key}) : super(key: key);
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.images.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 62,
        ),
        itemBuilder:
            (BuildContext context, int index) {
          return InkWell(
            child:  Container(
              height: 50,
              width: 139,
              padding: EffectStyle.padding(0, 0, 0, 0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    // ImageStyle.telegram,
                    controller.images[index],
                    height: 28,),
                  SizedBox(width: 10,),
                  Text(
                    // "Telegram",
                      controller.chooseMedia1[index],

                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                ],
              ),
              decoration: BoxDecoration(
                  color: ColorStyle.hex('F3E8E8'),

                  borderRadius: BorderRadius.circular(6)
              ),
            ),
            onTap: () {

            },
          );
        });
  }
}

class AddBank extends StatelessWidget {
  AddBank({Key? key}) : super(key: key);
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.chooseMedia2.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 45,
        ),
        itemBuilder:
            (BuildContext context, int index) {
          return InkWell(
            child:  Container(
              alignment: Alignment.center,
              // height: 40,
              // width: 139,
              padding: EffectStyle.padding(0, 0, 0, 0),
              child:  Text(
                // "Telegram",
                  controller.chooseMedia2[index],

                  style: TextStylesProductSans.textStyles_14
                      .apply(color: Colors.grey)),
              decoration: BoxDecoration(
                  color: ColorStyle.hex('F3E8E8'),

                  borderRadius: BorderRadius.circular(6)
              ),
            ),
            onTap: () {

            },
          );
        });
  }
}


class AddBankEKYC extends StatelessWidget {
  AddBankEKYC({Key? key}) : super(key: key);
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.chooseMedia3.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 45,
        ),
        itemBuilder:
            (BuildContext context, int index) {
          return InkWell(
            child:  Container(
              alignment: Alignment.center,
              // height: 40,
              // width: 139,
              padding: EffectStyle.padding(0, 0, 0, 0),
              child:  Text(
                // "Telegram",
                  controller.chooseMedia3[index],

                  style: TextStylesProductSans.textStyles_16
                      .apply(color: Colors.grey)),
              decoration: BoxDecoration(
                  color: ColorStyle.hex('F3E8E8'),

                  borderRadius: BorderRadius.circular(6)
              ),
            ),
            onTap: () {

            },
          );
        });
}  }


class ChooseHistory extends StatelessWidget {
  ChooseHistory({Key? key}) : super(key: key);
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: controller.chooseHistory1.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 45,
        ),
        itemBuilder:
            (BuildContext context, int index) {
          return InkWell(
            child:  Container(
              alignment: Alignment.center,
              // height: 40,
              // width: 139,
              padding: EffectStyle.padding(0, 0, 0, 0),
              child:  Text(
                // "Telegram",
                  controller.chooseHistory1[index],

                  style: TextStylesProductSans.textStyles_14
                      .apply(color: Colors.grey)),
              decoration: BoxDecoration(
                  color: ColorStyle.hex('F3E8E8'),

                  borderRadius: BorderRadius.circular(6)
              ),
            ),
            onTap: () {

            },
          );
        });
  }
}


