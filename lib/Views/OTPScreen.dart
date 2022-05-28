import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import 'package:inr_d/Components/TextButtonCustom.dart';
import 'package:inr_d/Styles/ColorStyle.dart';
import 'package:inr_d/Styles/TextStyles.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final focusNode = FocusNode();
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 200), () {
      focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.grey,
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  icon: Icon(Icons.question_mark_rounded, color: Colors.grey,),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
          SizedBox(width: 16,)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Enter your PIN",
                  style: TextStylesProductSans.textStyles_26),
              SizedBox(
                height: 10,
              ),
              Text("Enter the secure PIN to access your account",
                  style: TextStylesProductSans.textStyles_14
                      .apply(color: Colors.grey)),
              SizedBox(
                height: 120,
              ),
              InkWell(
                child: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration (
                            color: (textController.text.length > 0) ? ColorStyle.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: (textController.text.length > 0) ? Colors.transparent : Colors.grey,
                              width: 1,
                            )
                        ),
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
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                          ),
                          onChanged: (text) {
                            // if (otpCount < 4 ) {
                            //   otpCount +=1;
                            // } else if (text == '') {
                            //   otpCount -=1;
                            // }
                            //
                            // print(otpCount);
                            setState(() {
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration (
                            color: (textController.text.length > 1) ? ColorStyle.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: (textController.text.length > 1) ? Colors.transparent : Colors.grey,
                              width: 1,
                            )
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration (
                            color: (textController.text.length > 2) ? ColorStyle.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: (textController.text.length > 2) ? Colors.transparent : Colors.grey,
                              width: 1,
                            )
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration (
                            color: (textController.text.length > 3) ? ColorStyle.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: (textController.text.length > 3) ? Colors.transparent : Colors.grey,
                              width: 1,
                            )
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Colors.transparent
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  focusNode.requestFocus();
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                child: Text('Forgot PIN ?',
                  style: TextStylesProductSans.textStyles_16.apply(
                      color: ColorStyle.primaryColor
                  ),
                ),
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


