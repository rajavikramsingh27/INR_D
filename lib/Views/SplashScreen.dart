import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';
import '../Styles/ImageStyle.dart';
import '../Views/MobileNumber.dart';
import '../Views/VerificationCode.dart';
import 'PINScreen.dart';


// SvgPicture.asset(
// ImageStyle.inr_D,
// fit: BoxFit.contain,
// height: 100,
// width: 100,
// ),

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      final isLogedIn = GetStorage().read('isLogin') ?? false;
      if (isLogedIn) {
        Get.to(PINScreen(
          title: 'Enter your PIN',
          desc:
          "Enter the secure PIN to access your account",
          isForgotPINShow: true,
          enterSetConfirmPIN: 0,
        ));
      } else {
        Get.to(MobileNumber());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      ImageStyle.bgSplash,
                    ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageStyle.logoWhiteBG,
                  height: 170,
                ),
                Text(
                    "INR(D)",
                    style: TextStylesProductSans.textStyles_40.apply(
                        color: Colors.white
                    )
                )
              ],
            )
        )
    );  }
}


