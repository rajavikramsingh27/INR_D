import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inr_d/Components/TextFieldCustom.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';

class ManualDeposit extends StatelessWidget {
  final String? title;
  final List<String>? arrBankDetails;
  ManualDeposit({Key? key,
    required this.title,
    required this.arrBankDetails,
  }) : super(key: key);

  textFieldComponents(String text) {
    return TextFieldCustomSuffix(
      padding: EffectStyle.padding(10, 10, 10, 10),
      hintText: text,
      textStyle: TextStylesProductSans.textStyles_14.apply(
        color: Colors.black,
        fontWeightDelta: 1,
      ),
      colorFill: ColorStyle.white,
      colorBorder: Colors.black12,
      radiusBorder: 6,
      suffix: Icon(Icons.copy, color: ColorStyle.grey,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        title: '$title Manual Deposit',
        leading: BackButton(
          color: ColorStyle.grey,
        ),
        trailings: [
          IconButton(
            padding: EdgeInsets.zero,
            iconSize: 60,
            icon: Icon(
              Icons.arrow_right_rounded,
              color: ColorStyle.primaryColor,
            ),
            onPressed: () {

            },
          ),
        ],
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              itemCount: arrBankDetails!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 16,);
              },
              itemBuilder: (context, index) {
                return textFieldComponents(arrBankDetails![index]);
              },
            ),
            SizedBox(height: 16,),
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
              height: 16,
            ),
            TextFieldCustomOutline(
              maxLines: 6,
              padding: EffectStyle.padding(10, 10, 10, 10),
              hintText: '',
              textStyle: TextStylesProductSans.textStyles_14.apply(
                color: Colors.black,
                fontWeightDelta: 1,
              ),
              colorFill: ColorStyle.white,
              colorBoder: Colors.black12,
              radiusBorder: 6,
            ),
            SizedBox(
              height: 16,
            ),
            Text("Content will be edit by admin",
                style: TextStylesProductSans.textStyles_14
                    .apply(color: ColorStyle.primaryColor)),
          ],
        )
      ),
    );
  }
}
