import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/Utils/image.dart';
import 'package:dainsleif_journal/cubit/nation_detail_cubit/nation_detail_cubit.dart';
import 'package:dainsleif_journal/cubit/weapon_detail_cubit/weapon_cubit.dart';
import 'package:dainsleif_journal/repositiory/api_service/api_strings.dart';
import 'package:dainsleif_journal/screen/widget/cache_image_widget.dart';
import 'package:dainsleif_journal/screen/widget/custom_app_bar.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeaponDetailScreen extends StatelessWidget {
  final String name;

  const WeaponDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: ''),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
        child: BlocProvider(
          create: (context) => WeaponDetailCubit(name),
          child: BlocBuilder<WeaponDetailCubit, WeaponDetailState>(
            builder: (context, state) {
              if (state is WeaponLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              width: 4.w,
                              color: MyColor.goldColor,
                            )),
                        child: Stack(
                          children: [
                            Transform.scale(
                              scale: 1.25,
                              child: Image.asset(
                                MyImage.weaponSplash,
                                height: 400.h,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              child: CacheImageWidget(
                                imageUrl: '${ApiStrings.baseUrl}${ApiStrings.weapons}$name/icon',
                                height: 400.h,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Column(
                                children: [
                                  MyText(
                                    text: state.weaponModal.baseAttack.toString() ?? '',
                                    color: MyColor.violetColor,
                                  ),
                                  const MyText(
                                    text: 'Base ATK',
                                    color: MyColor.violetColor,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  MyText(
                                    text: state.weaponModal.subStat.toString() ?? '',
                                    color: MyColor.violetColor,
                                  ),
                                  const MyText(
                                    text: 'Sub Stat',
                                    color: MyColor.violetColor,
                                  ),
                                ],
                              ),
                            ]),
                            SizedBox(height: 10.h),
                            MyText(
                              text: state.weaponModal.name ?? '',
                              color: MyColor.violetColor,
                            ),
                            SizedBox(height: 10.h),
                            MyText(
                              text: state.weaponModal.type.toString() ?? '',
                              color: MyColor.violetColor,
                            ),
                            SizedBox(height: 10.h),
                            MyText(
                              text: state.weaponModal.rarity.toString() ?? '',
                              color: MyColor.violetColor,
                            ),
                            SizedBox(height: 10.h),
                            MyText(
                              text: state.weaponModal.passiveName.toString() ?? '',
                              color: MyColor.violetColor,
                            ),
                            SizedBox(height: 10.h),
                            MyText(
                              text: state.weaponModal.passiveDesc.toString() ?? '',
                              color: MyColor.violetColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is WeaponLoading) {
                return MyLoader();
              } else {
                return MyError();
              }
            },
          ),
        ),
      ),
    );
  }
}
