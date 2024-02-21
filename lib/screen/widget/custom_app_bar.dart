import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String text;
  final bool notBack;

  CustomAppBar({
    super.key,
    this.height = kToolbarHeight,
    required this.text,
    this.notBack = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // toolbarHeight: 400.h,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: notBack
          ? Container()
          : IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      iconTheme: const IconThemeData(color: MyColor.blackColor),
      title: MyText(
        text: text.toUpperCase(),
        color: MyColor.blackColor,
        fontSize: 20.sp,
      ),
    );
  }
}
