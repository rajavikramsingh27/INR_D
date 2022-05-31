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
import '../Controllers/ManualDepositController.dart';
import 'package:get/get.dart';

class ManualDeposit extends StatelessWidget {
  final String? title;
  final List<String>? arrBankDetails;

  ManualDeposit({
    Key? key,
    required this.title,
    required this.arrBankDetails,
  }) : super(key: key);

  final controller = Get.put(ManualDepositController());

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
      suffix: Icon(
        Icons.copy,
        color: ColorStyle.grey,
      ),
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
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder(
        init: ManualDepositController(),
        initState: (state) {},
        builder: (auth) {
          return Obx(() => SingleChildScrollView(
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
                      return SizedBox(
                        height: 16,
                      );
                    },
                    itemBuilder: (context, index) {
                      return textFieldComponents(arrBankDetails![index]);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: ColorStyle.grey.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Identifier',
                          style: TextStylesProductSans.textStyles_15
                              .apply(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Unique ID: 123456',
                                  style: TextStylesProductSans.textStyles_15
                                      .apply(color: Colors.black),
                                ),
                                Text(
                                  'Must be included in wire Memo or Reference field',
                                  style: TextStylesProductSans.textStyles_12
                                      .apply(color: ColorStyle.yellow),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.copy,
                              color: ColorStyle.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                controller.isCheckAccountIdentifier.value
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Text(
                                      'I have included my Account Identifier 124356 in my wire transfer and confirm'
                                      'that the name on my bank account matches the name on my INR(D) account.',
                                      // maxLines: 3,
                                      style: TextStyle(
                                        fontFamily:
                                            TextStylesProductSans.kFontFamily,
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ))),
                            ],
                          ),
                          onTap: () {
                            controller.isCheckAccountIdentifier.value = !controller.isCheckAccountIdentifier.value;
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // Text("Content will be edit by admin",
                  //     style: TextStylesProductSans.textStyles_14
                  //         .apply(color: ColorStyle.primaryColor)),
                ],
              )));
        },
      ),
    );
  }
}
