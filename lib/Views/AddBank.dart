import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inr_d/Controllers/AddBankController.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/PickerCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';
import '../Utils/Global.dart';
import '../Views/BankTransfer.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Utils/Constants.dart';
import 'package:http_parser/http_parser.dart';


class AddBank extends StatelessWidget {
  final String? title;
  final List<String> arrBankFormDetails;
  final bool? isOwn;

  AddBank({
    Key? key,
    required this.title,
    required this.arrBankFormDetails,
    required this.isOwn,
  }) : super(key: key);

  final controller = Get.put(AddBankController());

  dropdownButtonCustom() {
    return DropdownButtonCustom(
      padding: EffectStyle.padding(10, 10, 10, 10),
      colorBorder: Colors.black12,
      radiusBorder: 6,
      // bgColor: Colors.white,
      dropdownColor: Colors.white,
      textStyle: TextStylesProductSans.textStyles_14.apply(
        color: ColorStyle.grey,
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
                    border: Border.all(
                        color: ColorStyle.grey.withOpacity(0.4))),
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
                    border: Border.all(
                        color: ColorStyle.grey.withOpacity(0.4))),
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

  // Future<String>
  upload({required File file, required String id, required String id_type}) async {
    showLoaderGetX();
    final headersParameters = {'Content-Type': 'multipart/form-data'};
    final postUri = Uri.parse('http://34.205.18.154:4000/users/uploadIds');
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);
    
    request.fields['inrd_no'] = GetStorage().read(Constants.instance.kMobileNumber) ?? '';
    request.fields['id'] = id;
    request.fields['id_type'] = id_type;

    debugPrint(request.fields.toString());

    final multipartFile = await http.MultipartFile.fromPath('file', file.path, contentType: MediaType('image', 'png'));
    // request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(file.uri).readAsBytes(), contentType: MediaType('image', 'jpg')));
    //
    request.files.add(multipartFile);
    request.headers.addAll(headersParameters);

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final resbody = jsonDecode(response.body);
      final mapResponse = Map<String, dynamic>.from(resbody);
      debugPrint(mapResponse.toString());
      hideLoader();
    } catch (error) {
      debugPrint(error.toString());
      hideLoader();
    }

    // return mapResponse["avtar"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle(
          overlayStyle: SystemUiOverlayStyle.dark,
          title: '$title Bank',
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
                  () =>
                  SingleChildScrollView(
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
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 16,
                            );
                          },
                          itemBuilder: (context, index) {
                            return TextFieldCustomOutline(
                              padding: EffectStyle.padding(10, 10, 10, 10),
                              hintText: arrBankFormDetails[index],
                              controller: controller
                                  .arrTextEditController[index],
                              textStyle: TextStylesProductSans.textStyles_14
                                  .apply(
                                color: Colors.black,
                                fontWeightDelta: 1,
                              ),
                              colorFill: ColorStyle.white,
                              colorBoder: Colors.black12,
                              radiusBorder: 6,
                            );
                          },

                        ),
                        if (!this.isOwn!)
                          SizedBox(
                            height: 16,
                          ),
                        if (!this.isOwn!)
                          dropdownButtonCustom(),
                        if (!this.isOwn!)
                          SizedBox(
                            height: 16,
                          ),
                        if (!this.isOwn!)
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
                                          color: ColorStyle.grey.withOpacity(
                                              0.4))),
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
                                          style: TextStylesProductSans
                                              .textStyles_14
                                              .apply(color: ColorStyle.grey)),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Get.focusScope!.unfocus();
                                  PickerCustom.imagePicker((file)  {
                                    upload(file: file, id: 'pan_photo', id_type: 'aadhaar');
                                  });
                                }
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          onTap: () {
                            Get.to(BankTransfer());
                            return;

                            Get.focusScope!.unfocus();

                            final bankTitleForValidation = 'Please enter';
                            if (controller.arrTextEditController[0].text
                                .isEmpty) {
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
                            } else if (controller.selectedDropDown.value
                                .isEmpty) {
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
                                  .add(
                                  controller.arrTextEditController[0].text);
                              controller.arrBankDetails
                                  .add(
                                  controller.arrTextEditController[1].text);
                              controller.arrBankDetails
                                  .add(
                                  controller.arrTextEditController[2].text);
                              controller.arrBankDetails
                                  .add(
                                  controller.arrTextEditController[3].text);
                              controller.arrBankDetails
                                  .add(controller.selectedDropDown.value);
                              if (title!.contains('INR')) {
                                controller.arrBankDetails
                                    .add(
                                    controller.controllerPanCard.value.text);
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
                            padding: EdgeInsets.zero,
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
