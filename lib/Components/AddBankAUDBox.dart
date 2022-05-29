import 'package:flutter/material.dart';

import '../Styles/ColorStyle.dart';
import '../Styles/TextStyles.dart';


class AddBankAUDBox extends StatelessWidget {
  const AddBankAUDBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: ColorStyle.grey
              )
          ),
        ),
        SizedBox(
          height: 17,
        ),
        Text("Content will be edit by admin",
            style: TextStylesProductSans.textStyles_14
                .apply(color: ColorStyle.primaryColor)),

      ],
    );
  }
}
