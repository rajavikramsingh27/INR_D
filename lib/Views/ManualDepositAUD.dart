import 'package:flutter/material.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';

class ManualDepositAUD extends StatelessWidget {
  const ManualDepositAUD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        title: 'Manual Deposit',
        onTapTrailing: () {},
      ),
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCustomOutline(
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'Name :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              TextFieldCustomOutline(
                keyboardType: TextInputType.number,
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'Account No. :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              TextFieldCustomOutline(
                keyboardType: TextInputType.number,
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'BSB No. :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              TextFieldCustomOutline(
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'Bank Name :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Container(
                    child:  TextFieldCustomOutline(
                      padding: EffectStyle.padding(10, 10, 10, 10),
                      hintText: 'Pay ID :',
                      textStyle: TextStylesProductSans.textStyles_14.apply(
                        color: Colors.black,
                        fontWeightDelta: 1,
                      ),
                      colorFill: ColorStyle.white,
                      colorBoder: Colors.black12,
                      radiusBorder: 6,
                    ),
                    height: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: ColorStyle.grey
                        )
                    ),
                  ),
                  Container(
                    child:  TextFieldCustomOutline(
                      padding: EffectStyle.padding(10, 10, 10, 10),
                      hintText: 'Pay ID :',
                      textStyle: TextStylesProductSans.textStyles_14.apply(
                        color: Colors.black,
                        fontWeightDelta: 1,
                      ),
                      colorFill: ColorStyle.white,
                      colorBoder: Colors.black12,
                      radiusBorder: 6,
                    ),
                    height: 42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: ColorStyle.grey
                        )
                    ),
                  ),
                ],
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
                listValue: ['Select ID :', 'Driving Licence', 'Passport','National Card'],
                selectedValue: "Select ID :",
                onChanged: (text) {},
              ),
              SizedBox(
                height: 26,
              ),

              TextFieldCustomOutline(
                padding: EffectStyle.padding(10, 10, 10, 10),
                hintText: 'Pay ID :',
                textStyle: TextStylesProductSans.textStyles_14.apply(
                  color: Colors.black,
                  fontWeightDelta: 1,
                ),
                colorFill: ColorStyle.white,
                colorBoder: Colors.black12,
                radiusBorder: 6,
              ),
              SizedBox(
                height: 26,
              ),
              TextButtonCustom(
                text: "SUBMIT",
                colorBG: ColorStyle.primaryColor,
                textStyle: TextStylesProductSans.textStyles_16
                    .apply(color: Colors.white),
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  // Get.to(VerificationCode());
                },
              ),
              SizedBox(
                height: 22,
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
                height: 17,
              ),
              Text("Content will be edit by admin",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: ColorStyle.primaryColor)),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
