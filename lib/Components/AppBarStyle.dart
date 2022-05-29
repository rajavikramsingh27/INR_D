
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Styles/ImageStyle.dart';
import '../Styles/TextStyles.dart';

adsfdsf() {
  return AppBar(
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
      );
}

class AppBarStyle extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTapTrailing;
final String? title;

  AppBarStyle({
    Key? key,
    this.onTapTrailing,
    this.title = 'Title ... ',
  }) : super(key: key);

  double heightAppBar = 70;

  @override
  Size get preferredSize => new Size.fromHeight(heightAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
          title!,
          style: TextStylesProductSans.textStyles_20.apply(
            color: Colors.grey
          )
      ),
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
                onPressed: onTapTrailing,
              ),
            ),
          ],
        ),
        SizedBox(width: 16,)
      ],
    );
  }
}


class AppBarStyleHome extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTapTrailing;
  final String? title;

  AppBarStyleHome({
    Key? key,
    this.onTapTrailing,
    this.title = 'Title ... ',
  }) : super(key: key);

  double heightAppBar = 70;

  @override
  Size get preferredSize => new Size.fromHeight(heightAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
          title!,
          style: TextStylesProductSans.textStyles_20.apply(
              color: Colors.grey
          )
      ),
      leading: Icon(
     Icons.notifications_none_rounded
      ),
      actions: [
        Row(
          children: [
    Image.asset(
      ImageStyle.Layer212Image,
      height: 21,
    ),
          ],
        ),
        SizedBox(width: 16,)
      ],
    );
  }
}
