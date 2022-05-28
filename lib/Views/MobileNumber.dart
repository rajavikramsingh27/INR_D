import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Components/TextFieldCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:get/get.dart';
import '../Views/PINScreen.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ColorStyle.dart';
import 'package:country_picker/country_picker.dart';
import '../Controllers/MobileNumberController.dart';
import '../Views/VerificationCode.dart';

class MobileNumber extends StatelessWidget {
  MobileNumber({Key? key}) : super(key: key);

  final controller = Get.put(MobileNumberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
        ),
      ),
      body:GetBuilder(
        init: MobileNumberController(),
        initState: (state) {

        },
        builder: (auth) {
          return Obx(()=> SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Let's Get Started",
                      style: TextStylesProductSans.textStyles_26),
                  Text("We will send an OTP to your mobile number",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          // width: 100,
                          height: 50,
                          padding: EdgeInsets.only(left: 6, right: 6),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: ColorStyle.grey,
                                width: 1,
                              )
                          ),
                          child: Row(
                            children: [
                              Text(
                                controller.flagEmoji.value,
                                style: TextStyle(
                                  fontSize: 22
                              ),),
                              Icon(Icons.keyboard_arrow_down_sharp, size: 30,)
                            ],
                          ),
                        ),
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                            exclude: <String>['KN', 'MF'],
                            //Optional. Shows phone code before the country name.
                            showPhoneCode: true,
                            showWorldWide: false,
                            onSelect: (Country country) {
                              print('Select country: ${country.flagEmoji}');
                              print('Select country: ${country.phoneCode}');

                              controller.flagEmoji.value = country.flagEmoji;
                              controller.phoneCode.value = country.phoneCode;
                            },
                            // Optional. Sets the theme for the country list picker.
                            countryListTheme: CountryListThemeData(
                              // Optional. Sets the border radius for the bottomsheet.
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              // Optional. Styles the search field.
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 6,),
                      Expanded(
                          child: TextFieldCustomPrefix(
                            colorBorder: ColorStyle.grey,
                            hintText: 'Enter mobile number',
                            textStyle: TextStylesProductSans.textStyles_15
                                .apply(color: Colors.black),
                            prefix: Container(
                              padding: EdgeInsets.only(right: 6, left: 6),
                              margin: EdgeInsets.only(top: 16, bottom: 16, right: 6, left: 6),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                        color: ColorStyle.grey,
                                        width: 1,
                                      )
                                  )
                              ),
                              child: Text(
                                '+'+controller.phoneCode.value,
                                style: TextStylesProductSans.textStyles_16
                                    .apply(color: Colors.black),
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextButtonCustom(
                    text: "SEND",
                    colorBG: ColorStyle.primaryColor,
                    textStyle: TextStylesProductSans.textStyles_16
                        .apply(color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      Get.to(VerificationCode());
                    },
                  ),
                ],
              ),
            ),
          ),);
        },
      )
    );
  }
}
