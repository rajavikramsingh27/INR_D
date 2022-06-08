
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
import '../Utils/Constants.dart';
import '../Controllers/SplashScreenController.dart';
import 'package:get/get.dart';
import '../Views/TabbarScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(SplashScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      final mobileNumber = GetStorage().read(Constants.instance.kMobileNumber) ?? '';
      debugPrint(mobileNumber);

      if (mobileNumber.toString().isNotEmpty) {
        controller.getUser(
          mobileNumber: mobileNumber
        );
      } else {
        Get.to(MobileNumber());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
          init: SplashScreenController(),
          initState: (state) {

          },
          builder: (auth) {
            return Obx(()=>Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          ImageStyle.bgSplash,
                        ))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SafeArea(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              left: 30
                          ),
                          child: Text(
                            'Hello '+controller.name.value,
                            textAlign: TextAlign.left,
                            style: TextStylesProductSans.textStyles_22.apply(
                              color: Colors.white,
                              fontWeightDelta: 1,
                            ),
                          ),
                        )
                    ),
                    Column(
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
                    ),
                    SizedBox()
                  ],
                )
            ));
          },
        )
    );  }
}


