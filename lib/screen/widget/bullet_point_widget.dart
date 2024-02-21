import 'package:dainsleif_journal/Utils/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulletPointWidget extends StatelessWidget {
  const BulletPointWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyImage.primoGems,
      height: 35.h,
      width: 35.w,
    );
  }
}
