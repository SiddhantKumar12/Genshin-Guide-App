import 'package:dainsleif_journal/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Divider(thickness: 2.h, color: MyColor.turcoiseColor.withOpacity(0.3)),
    );
  }
}
