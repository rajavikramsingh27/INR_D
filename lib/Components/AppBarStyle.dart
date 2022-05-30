import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';

class AppBarStyle extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final SystemUiOverlayStyle? overlayStyle;
  final Widget? leading;
  final List<Widget>? trailings;
  final Color? titleColor;

  AppBarStyle({
    Key? key,
    this.title = 'Title ... ',
    this.leading = const SizedBox(width: 0,),
    required this.overlayStyle,
    this.trailings,
    this.titleColor = Colors.grey
  }) : super(key: key);

  double heightAppBar = 70;

  @override
  Size get preferredSize => new Size.fromHeight(heightAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: overlayStyle,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(title!,
          style: TextStylesProductSans.textStyles_20.apply(color: titleColor)),
      leading: leading,
      actions: [
        // Container(
        //   height: 36,
        //   width: 36,
        //   padding: EdgeInsets.zero,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(40),
        //       border: Border.all(
        //         color: Colors.grey,
        //         width: 1,
        //       )),
        //   child: IconButton(
        //     padding: EdgeInsets.zero,
        //     iconSize: 20,
        //     icon: Icon(
        //       Icons.question_mark_rounded,
        //       color: Colors.grey,
        //     ),
        //     onPressed: onTapTrailing,
        //   ),
        // ),

        if (trailings != null)
        Row(
          children: trailings!
        ),
        SizedBox(
          width: 16,
        )
      ],
    );
  }
}
