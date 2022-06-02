
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Controllers/PINScreenController.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:get/get.dart';
import '../Components/AppBarStyle.dart';
import 'package:get_storage/get_storage.dart';
import '../Views/TabbarScreen.dart';
import '../Utils/Global.dart';

class PINScreen extends StatefulWidget {
  String? title;
  String? desc;

  final int enterSetConfirmPIN;
  final bool isForgotPINShow;

  PINScreen({Key? key,
    required this.title,
    required this.desc,
    required this.isForgotPINShow,
    required this.enterSetConfirmPIN,
  }) : super(key: key);

  @override
  _PINScreenState createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {
  final controller = Get.put(PINScreenController());

  FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();
  
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      focusNode.requestFocus();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PINScreenController(),
      initState: (state) {

      },
      builder: (auth) {
        return Obx(()=>Scaffold(
          appBar: AppBarStyle(
            leading: GetStorage().read('isLogin') ?? false ? SizedBox() : BackButton(
              color: Colors.grey,
            ),
            overlayStyle: SystemUiOverlayStyle.dark,
            title: '',
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
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(controller.pinConfirmValue.value.toString()),
                  Text(widget.title!, style: TextStylesProductSans.textStyles_26),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.desc!,
                      style: TextStylesProductSans.textStyles_14
                          .apply(color: Colors.grey)),
                  SizedBox(
                    height: 120,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.all(0)),
                    child: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: (textController.text.length > 0)
                                    ? ColorStyle.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: (textController.text.length > 0)
                                      ? Colors.transparent
                                      : Colors.grey,
                                  width: 1,
                                )),
                            child: TextField(
                              maxLength: 4,
                              focusNode: focusNode,
                              controller: textController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                              ),
                              onChanged: (text) {
                                if (widget.enterSetConfirmPIN == 0) {
                                  if (textController.text.length > 3) {
                                    Get.back();
                                    Get.offAll(TabbarScreen());
                                  }
                                } else if (widget.enterSetConfirmPIN == 1) {
                                  if (textController.text.length > 3) {
                                    controller.pinConfirmValue.value = textController.text;

                                    if (controller.pinValue.value != controller.pinValue.value) {
                                      'Confirm PIN is not same with you setted PIN'.showError();
                                    } else {
                                      GetStorage().write('isLogin', true);

                                      Get.back();
                                      Get.offAll(TabbarScreen());
                                    }
                                  }
                                } else if (widget.enterSetConfirmPIN == 2) {
                                  if (textController.text.length > 3) {
                                    controller.pinValue.value = textController.text;
                                    Get.back();
                                    Get.to(PINScreen(
                                      title: 'Confirm your PIN',
                                      desc: "Prevent unauthorised access.",
                                      isForgotPINShow: false,
                                      enterSetConfirmPIN: 1,
                                    ));
                                  }
                                }
                              },
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: (textController.text.length > 1)
                                    ? ColorStyle.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: (textController.text.length > 1)
                                      ? Colors.transparent
                                      : Colors.grey,
                                  width: 1,
                                )),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: (textController.text.length > 2)
                                    ? ColorStyle.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: (textController.text.length > 2)
                                      ? Colors.transparent
                                      : Colors.grey,
                                  width: 1,
                                )),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: (textController.text.length > 3)
                                    ? ColorStyle.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: (textController.text.length > 3)
                                      ? Colors.transparent
                                      : Colors.grey,
                                  width: 1,
                                )),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      focusNode.requestFocus();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (widget.isForgotPINShow)
                    TextButton(
                      child: Text(
                        'Forgot PIN ?',
                        style: TextStylesProductSans.textStyles_16
                            .apply(color: ColorStyle.primaryColor),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.to(PINScreen(
                          title: 'Please set a PIN',
                          desc: "Prevent unauthorised access.",
                          isForgotPINShow: false,
                          enterSetConfirmPIN: 2,
                        ));
                      },
                    ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}


