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
  ManualDeposit({Key? key,
    required this.title,
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
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFieldComponents('Name'),
            SizedBox(height: 16,),
            textFieldComponents('Account No.'),
            SizedBox(height: 16,),
            textFieldComponents('BSB No.'),
            SizedBox(height: 16,),
            textFieldComponents('Bank Name'),
            SizedBox(height: 16,),
            textFieldComponents('Pay ID'),
            SizedBox(height: 16,),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: ColorStyle.grey.withOpacity(0.4),
                  width: 1
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                'Account Identifier',
                style: TextStylesProductSans.textStyles_16
                    .apply(color: Colors.grey.withOpacity(0.6))
                ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Unique ID: 1234567',
                              style: TextStylesProductSans.textStyles_16
                                  .apply(color: Colors.grey.withOpacity(0.6))
                          ),
                          Text(
                              'Must be included in wire Memo or Reference field',
                              style: TextStylesProductSans.textStyles_12
                                  .apply(color: ColorStyle.yellow.withOpacity(0.6))

                          ),
                        ],
                      ),
                      Icon(Icons.copy, color: ColorStyle.grey,),
                    ],
                  ),
                  SizedBox(height: 16,),
                  InkWell(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                          color: ColorStyle.grey,
                        ),
                        // Icon(Icons.check_box),
                        SizedBox(width: 6,),
                        Expanded(child: Text(
                            'I have included my Account Identifier 3435435 in my wire transfer and confirm that the name on my'
                                'bank account matches the name on my INR(D) account',
                            style: TextStylesProductSans.textStyles_12
                                .apply(color: ColorStyle.grey)

                        ),)
                      ],
                    ),
                    onTap: () {

                    },
                  )
                ],
              ),
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
