import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Components/TextFieldCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import '../Styles/ImageStyle.dart';
import '../Controllers/VerificationCodeController.dart';
import '../Views/PINScreen.dart';

class VerificationCode extends StatelessWidget {
  final controller = Get.put(VerificationCodeController());

  VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle(
        overlayStyle: SystemUiOverlayStyle.dark,
        leading: BackButton(
          color: Colors.grey,
        ),
        title: 'Enter Verification Code',
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
      body: GetBuilder(
        init: VerificationCodeController(),
        initState: (state) {
          controller.reset();
        },
        builder: (auth) {
          return Obx(()=>SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text("We have sent OTP on your number",
                      style: TextStylesProductSans.textStyles_16
                          .apply(color: Colors.grey)),
                  SizedBox(
                    height: 16,
                  ),
                  Image.asset(
                    ImageStyle.verificationCode,
                    fit: BoxFit.contain,
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 54,
                    width: 200,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFieldOTP(
                            controller: controller.txtOTP_First.value,
                            focusNode: controller.focusFirst,
                            onChanged: (text) {
                              if (controller.txtOTP_First.value.text.length > 0)
                                controller.focusSecond.requestFocus();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: TextFieldOTP(
                            controller: controller.txtOTP_Second.value,
                            focusNode: controller.focusSecond,
                            onChanged: (text) {
                              if (controller.txtOTP_Second.value.text.length > 0)
                                controller.focusThird.requestFocus();
                              else if (controller.txtOTP_Second.value.text == '')
                                controller.focusFirst.requestFocus();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: TextFieldOTP(
                            controller: controller.txtOTP_Third.value,
                            focusNode: controller.focusThird,
                            onChanged: (text) {
                              if (controller.txtOTP_Third.value.text.length > 0)
                                controller.focusFourth.requestFocus();
                              else if (controller.txtOTP_Third.value.text == '')
                                controller.focusSecond.requestFocus();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: TextFieldOTP(
                            controller: controller.txtOTP_Fourth.value,
                            focusNode: controller.focusFourth,
                            onChanged: (text) {
                              if (controller.txtOTP_Fourth.value.text.length > 0)
                                Get.to(PINScreen(
                                  title: 'Please set a PIN',
                                  desc:
                                  "Prevent unauthorised access.",
                                  isForgotPINShow: false,
                                  enterSetConfirmPIN: 2,
                                ));
                              else if (controller.txtOTP_Fourth.value.text == '')
                                controller.focusThird.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Didn't receive a OTP? ",
                            style: TextStylesProductSans.textStyles_16
                                .apply(color: Colors.grey)),
                        TextSpan(
                            text: 'Resend OTP',
                            style: TextStylesProductSans.textStyles_16
                                .apply(color: ColorStyle.primaryColor)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
