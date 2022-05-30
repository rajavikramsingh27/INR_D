import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';
import '../Views/DepositMoney.dart';


class AddCurrency extends StatelessWidget {
  const AddCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: 'Add Currency',
      ),
        body:SingleChildScrollView(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
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
                keyboardType: TextInputType.number,
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
                text: "DEPOSIT",
                colorBG: ColorStyle.primaryColor,
                textStyle: TextStylesProductSans.textStyles_16
                    .apply(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  Get.to(DeposiMoney());
                },
              ),
              SizedBox(
                height: 60,
              ),
              TextFieldCustomOutline(
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: '',
                maxLines: 6,
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
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
    );
  }
}
