import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inr_d/Controllers/AddBankController.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';
import '../Controllers/WalletController.dart';
import '../Utils/Global.dart';

class AddBank extends StatelessWidget {
  final String? title;
  final List<String> arrBankFormDetails;

  AddBank({
    Key? key,
    required this.title,
    required this.arrBankFormDetails,
  }) : super(key: key);

  final controller = Get.put(AddBankController());

  dropdownButtonCustom() {
    return DropdownButtonCustom(
      padding: EffectStyle.padding(10, 10, 10, 10),
      colorBorder: Colors.black12,
      radiusBorder: 6,
      textStyle: TextStylesProductSans.textStyles_14.apply(
        color: Colors.black,
        fontWeightDelta: 1,
      ),
      iconWidget: Icon(
        Icons.keyboard_arrow_down,
        color: ColorStyle.grey,
        size: 26,
      ),
      listValue: ['Select ID', 'Driving Licence', 'Passport', 'National Card'],
      selectedValue: 'Select ID',
      onChanged: (text) {
        controller.selectedDropDown.value = text!;
      },
    );
  }

  frontBack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: InkWell(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageStyle.cloudComputing,
                  height: 22,
                  color: ColorStyle.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("ID Front",
                    style: TextStylesProductSans.textStyles_14
                        .apply(color: ColorStyle.grey)),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: ColorStyle.grey.withOpacity(0.4))),
          ),
          onTap: () {},
        )),
        SizedBox(
          width: 30,
        ),
        Expanded(
            child: InkWell(
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageStyle.cloudComputing,
                  height: 22,
                  color: ColorStyle.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("ID Back",
                    style: TextStylesProductSans.textStyles_14
                        .apply(color: ColorStyle.grey)),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: ColorStyle.grey.withOpacity(0.4))),
          ),
          onTap: () {},
        ))
      ],
    );
  }

  listViewBankDetails() {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 6,
        separatorBuilder: (Get, index) {
          return SizedBox();
        },
        itemBuilder: (Get, index) {
          return Text(
            'Bank $index',
            style:
                TextStylesProductSans.textStyles_16.apply(color: Colors.white),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: 'Add $title Bank',
          leading: BackButton(
            color: ColorStyle.grey,
          ),
        ),
        body: GetBuilder(
          init: AddBankController(),
          initState: (state) {
            controller.countForTextEditingController.value =
                arrBankFormDetails.length;
            controller.reset();
          },
          builder: (auth) {
            return Obx(
              () => SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      itemCount: controller.arrTextEditController.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 16,
                        );
                      },
                      itemBuilder: (context, index) {
                        return TextFieldCustomOutline(
                          padding: EffectStyle.padding(10, 10, 10, 10),
                          hintText: arrBankFormDetails[index],
                          controller: controller.arrTextEditController[index],
                          textStyle: TextStylesProductSans.textStyles_14.apply(
                            color: Colors.black,
                            fontWeightDelta: 1,
                          ),
                          colorFill: ColorStyle.white,
                          colorBoder: Colors.black12,
                          radiusBorder: 6,
                        );
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    dropdownButtonCustom(),
                    SizedBox(
                      height: 16,
                    ),
                    frontBack(),
                    SizedBox(
                      height: 16,
                    ),
                    if (title!.contains('INR'))
                      Column(
                        children: [
                          TextFieldCustomOutline(
                            padding: EffectStyle.padding(10, 10, 10, 10),
                            hintText: 'Enter Pan Card Number',
                            controller: controller.controllerPanCard.value,
                            textStyle:
                                TextStylesProductSans.textStyles_14.apply(
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
                          InkWell(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: ColorStyle.grey.withOpacity(0.4))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageStyle.cloudComputing,
                                    height: 22,
                                    color: ColorStyle.grey,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Upload Pan Card",
                                      style: TextStylesProductSans.textStyles_14
                                          .apply(color: ColorStyle.grey)),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    TextButtonCustom(
                      text: "SUBMIT",
                      colorBG: ColorStyle.primaryColor,
                      textStyle: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.white),
                      width: MediaQuery.of(context).size.width,
                      onTap: () {
                        final bankTitleForValidation = 'Please enter';
                        if (controller.arrTextEditController[0].text.isEmpty) {
                          final value = arrBankFormDetails[0];
                          '$bankTitleForValidation $value'.showError();
                        } else if (controller
                            .arrTextEditController[1].text.isEmpty) {
                          final value = arrBankFormDetails[1];
                          '$bankTitleForValidation $value'.showError();
                        } else if (controller
                            .arrTextEditController[2].text.isEmpty) {
                          final value = arrBankFormDetails[2];
                          '$bankTitleForValidation $value'.showError();
                        } else if (controller
                            .arrTextEditController[3].text.isEmpty) {
                          final value = arrBankFormDetails[3];
                          '$bankTitleForValidation $value'.showError();
                        } else if (controller.selectedDropDown.value.isEmpty) {
                          final value = 'ID';
                          '$bankTitleForValidation $value'.showError();
                        } else {
                          if (title!.contains('INR')) {
                            if (controller
                                .controllerPanCard.value.text.isEmpty) {
                              final value = 'Enter Pan Card Number';
                              '$bankTitleForValidation $value'.showError();
                            }
                          }

                          print(controller.selectedDropDown.value);

                          controller.arrBankDetails.clear();
                          controller.arrBankDetails
                              .add(controller.arrTextEditController[0].text);
                          controller.arrBankDetails
                              .add(controller.arrTextEditController[1].text);
                          controller.arrBankDetails
                              .add(controller.arrTextEditController[2].text);
                          controller.arrBankDetails
                              .add(controller.arrTextEditController[3].text);
                          controller.arrBankDetails
                              .add(controller.selectedDropDown.value);
                          if (title!.contains('INR')) {
                            controller.arrBankDetails
                                .add(controller.controllerPanCard.value.text);
                          }
                        }
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
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.arrBankDetails.length,
                        padding: EdgeInsets.only(
                          // top: 16,
                          // bottom: 16,
                        ),
                        separatorBuilder: (Get, index) {
                          return SizedBox(
                            height: 6,
                          );
                        },
                        itemBuilder: (Get, index) {
                          return Text(
                            controller.arrBankDetails[index],
                            style: TextStylesProductSans.textStyles_16
                                .apply(color: Colors.black),
                          );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    if (controller.arrBankDetails.length != 0)
                      Text(
                        'Processing',
                        style: TextStylesProductSans.textStyles_16
                            .apply(color: Colors.black),
                      ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
