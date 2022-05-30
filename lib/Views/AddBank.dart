import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inr_d/Styles/ImageStyle.dart';
import '../Components/AppBarStyle.dart';
import '../Components/DropdownButtonCustom.dart';
import '../Components/TextButtonCustom.dart';
import '../Components/TextFieldCustomOutline.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';

class AddBank extends StatelessWidget {
  final String? title;
  final List<Widget> arrBankFormDetails;


  AddBank({Key? key,
    required this.title,
    required this.arrBankFormDetails,
  }) : super(key: key);

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
      body:SingleChildScrollView(
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
              itemCount: arrBankFormDetails.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 16,);
              },
              itemBuilder: (context, index) {
                return arrBankFormDetails[index];
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
        ),
      ),
    );
  }
}

class AddBank1 extends StatelessWidget {
  final String? title;
  AddBank1({Key? key,
    required this.title,
  }) : super(key: key);

  textFieldOutline(String title) {
    return TextFieldCustomOutline(
      padding: EffectStyle.padding(10, 10, 10, 10),
      hintText: title,
      textStyle: TextStylesProductSans.textStyles_14.apply(
        color: Colors.black,
        fontWeightDelta: 1,
      ),
      colorFill: ColorStyle.white,
      colorBoder: Colors.black12,
      radiusBorder: 6,
    );
  }

  dropdownButtonCustom() {
    return DropdownButtonCustom(
      padding: EffectStyle.padding(10, 10, 10, 10),
      colorBorder: Colors.black12,
      radiusBorder: 6,
      textStyle: TextStylesProductSans.textStyles_14.apply(
        color: Colors.black,
        fontWeightDelta: 1,
      ),
      iconWidget: Icon(Icons.keyboard_arrow_down, color: ColorStyle.grey, size: 26,),
      listValue: ['Select ID', 'Driving Licence', 'Passport','National Card'],
      selectedValue: "Select ID",
      onChanged: (text) {},
    );
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
      body:SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFieldOutline('Name'),
            SizedBox(
              height: 16,
            ),
            textFieldOutline('Account No.'),
            SizedBox(
              height: 16,
            ),
            textFieldOutline('BSB No.'),
            SizedBox(
              height: 16,
            ),
            textFieldOutline('Bank Name'),
            SizedBox(
              height: 16,
            ),
            dropdownButtonCustom(),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: InkWell(
                  child: Container(
                    height: 50,
                    child:Row(
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
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: ColorStyle.grey
                        )
                    ),
                  ),
                  onTap: () {

                  },
                )),
                SizedBox(width: 30,),
                Expanded(child: InkWell(
                  child: Container(
                    height: 50,
                    child:Row(
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
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: ColorStyle.grey
                        )
                    ),
                  ),
                  onTap: () {

                  },
                ))
              ],
            ),
            SizedBox(
              height: 16,
            ),

            if (title!.contains('INR'))
              Column(
                children: [
                  TextFieldCustomOutline(
                    padding: EffectStyle.padding(10, 10, 10, 10),
                    hintText: 'Enter Pan Card Number',
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
                  InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: ColorStyle.grey
                          )
                      ),
                      child:Row(
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
                          Text(
                              'Upload Pan Card',
                              style: TextStylesProductSans.textStyles_14
                                  .apply(color: ColorStyle.grey)),
                        ],
                      ),
                    ),
                    onTap: () {

                    },
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
        ),
      ),
    );
  }
}
