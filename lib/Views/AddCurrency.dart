import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';


class AddCurrency extends StatelessWidget {
  const AddCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Add Currency',
        trailings: [
          Container(
            height: 36,
            width: 36,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 20,
              icon: Icon(
                Icons.question_mark_rounded,
                color: Colors.grey,
              ),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
        body:SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonCustom(
                  padding: EffectStyle.padding(10, 10, 10, 10),
                  colorBorder: Colors.black12,
                  radiusBorder: 6,
                  textStyle: TextStylesProductSans.textStyles_14.apply(
                    color: Colors.black,
                    fontWeightDelta: 1,
                  ),
                  iconWidget: Icon(Icons.keyboard_arrow_down, color: ColorStyle.grey, size: 26,),
                  listValue: ['Select', 'Bitcoin', 'India','USA'],
                  selectedValue: "Select",
                  onChanged: (text) {},
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Enter Amount",
                    style: TextStylesProductSans.textStyles_14),
                SizedBox(
                  height: 7,
                ),
                TextFieldCustomOutline(
                  padding: EffectStyle.padding(10, 10, 10, 10),
                  hintText: 'Ex.\$320',
                  textStyle: TextStylesProductSans.textStyles_14.apply(
                    color: Colors.black,
                    fontWeightDelta: 1,
                  ),
                  colorFill: ColorStyle.white,
                  colorBoder: Colors.black12,
                  radiusBorder: 6,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Min.",
                        style: TextStylesProductSans.textStyles_14
                            .apply(color: Colors.grey)),
                    Text("Max.",
                        style: TextStylesProductSans.textStyles_14
                            .apply(color: Colors.grey)),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 16,
                ),
                TextButtonCustom(
                  text: "DPOSIT",
                  colorBG: ColorStyle.primaryColor,
                  textStyle: TextStylesProductSans.textStyles_16
                      .apply(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    // Get.to(VerificationCode());
                  },
                ),
                SizedBox(
                  height: 63,
                ),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: ColorStyle.grey
                    )
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text("Content will be edit by admin",
                    style: TextStylesProductSans.textStyles_14
                        .apply(color: ColorStyle.primaryColor)),
              ],
            ),
          ),
        ),
    );
  }
}
