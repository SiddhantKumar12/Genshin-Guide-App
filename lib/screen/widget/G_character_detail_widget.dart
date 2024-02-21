import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/Utils/image.dart';
import 'package:dainsleif_journal/screen/widget/bullet_point_widget.dart';
import 'package:dainsleif_journal/screen/widget/cache_image_widget.dart';
import 'package:dainsleif_journal/screen/widget/divider_widget.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../Utils/choose_image.dart';
import '../../modals/g_character_detail_modal.dart';

class GCharacterDetailWidget extends StatelessWidget {
  final GCharacterDetailModal gCharacterDetailModal;
  final String name;
  const GCharacterDetailWidget({super.key, required this.gCharacterDetailModal, required this.name});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 670.h,
            child: Stack(
              children: [
                Container(
                  height: 570.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        ChooseImage.chooseElementBGImage(gCharacterDetailModal.vision?.toLowerCase() ?? ''),
                        height: 570.h,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Transform.scale(
                                scale: 1.3,
                                child: CacheImageWidget(
                                  imageUrl: '${MyImage.characterImage}$name/portrait',
                                  fit: BoxFit.fitHeight,
                                  height: 400.h,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 65.w,
                                  margin: EdgeInsets.only(top: 10.h),
                                  child: ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: gCharacterDetailModal.constellations?.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.all(6.w),
                                        child: CircleAvatar(
                                          backgroundColor: MyColor.amberColor,
                                          backgroundImage: NetworkImage('${MyImage.characterImage}$name/constellation-${index + 1}'),
                                          radius: 30.r,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 15.w),
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: MyColor.whiteColor,
                    ),
                    height: 220.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: gCharacterDetailModal.name ?? '',
                          fontSize: 24.sp,
                          color: MyColor.titleTextColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(text: 'Rarity', fontSize: 18.sp, color: MyColor.subtitleTextColor),
                                  RatingBar.builder(
                                    itemSize: 20.sp,
                                    initialRating: double.parse(gCharacterDetailModal.rarity.toString()),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: MyColor.amberColor,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(text: 'Element', fontSize: 18.sp, color: MyColor.subtitleTextColor),
                                  MyText(text: gCharacterDetailModal.vision ?? '', fontSize: 20.sp),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(text: 'Weapon', fontSize: 18.sp, color: MyColor.subtitleTextColor),
                                  MyText(text: gCharacterDetailModal.weapon ?? '', fontSize: 20.sp),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(text: 'Birthday', fontSize: 18.sp, color: MyColor.subtitleTextColor),
                                  MyText(
                                      text:
                                          gCharacterDetailModal.birthday == 'Unknown' ? 'Unknown' : formatDate(gCharacterDetailModal.birthday ?? ''),
                                      fontSize: 19.sp),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(height: 10.h, color: MyColor.transparentColor),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: MyColor.whiteColor,
            ),
            // color: MyColor.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BulletPointWidget(),
                    SizedBox(width: 5.w),
                    MyText(text: 'Overview', fontSize: 20.sp, color: MyColor.titleTextColor),
                  ],
                ),
                SizedBox(height: 5.h),
                MyText(text: gCharacterDetailModal.description ?? '', fontSize: 14.sp, color: MyColor.subtitleTextColor),
                MyDivider(),
                Row(
                  children: [
                    BulletPointWidget(),
                    SizedBox(width: 5.w),
                    MyText(text: 'Skill Talents', fontSize: 20.sp, color: MyColor.titleTextColor),
                  ],
                ),
                SizedBox(height: 20.h),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: gCharacterDetailModal.skillTalents?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: CircleAvatar(
                                    backgroundColor: MyColor.amberColor,
                                    backgroundImage: NetworkImage(
                                      index == 0
                                          ? MyImage.characterImage + name + '/talent-na'
                                          : index == 1
                                              ? MyImage.characterImage + name + '/talent-skill'
                                              : MyImage.characterImage + name + '/talent-burst',
                                    ),
                                    radius: 40.r),
                              ),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  children: [
                                    MyText(
                                      text: gCharacterDetailModal.skillTalents?[index].name ?? '',
                                      fontSize: 16.sp,
                                      color: MyColor.titleTextColor,
                                    ),
                                    MyText(
                                      text: gCharacterDetailModal.skillTalents?[index].unlock ?? '',
                                      fontSize: 14.sp,
                                      color: MyColor.subtitleTextColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          MyText(
                            text: gCharacterDetailModal.skillTalents?[index].description ?? '',
                            fontSize: 14.sp,
                            color: MyColor.subtitleTextColor,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      );
                    }),
                MyDivider(),
                Row(
                  children: [
                    BulletPointWidget(),
                    SizedBox(width: 5.w),
                    MyText(text: 'Passive talents', fontSize: 20.sp, color: MyColor.titleTextColor),
                  ],
                ),
                SizedBox(height: 20.h),
                gCharacterDetailModal.passiveTalents == null
                    ? Container()
                    : ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: gCharacterDetailModal.passiveTalents?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CircleAvatar(
                                        backgroundColor: MyColor.amberColor,
                                        backgroundImage: NetworkImage(
                                          index == 0
                                              ? '${MyImage.characterImage}$name/talent-passive-1'
                                              : index == 1
                                                  ? '${MyImage.characterImage}$name/talent-passive-2'
                                                  : '${MyImage.characterImage}$name/talent-passive-0',
                                        ),
                                        radius: 40.r),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      children: [
                                        MyText(
                                          text: gCharacterDetailModal.passiveTalents?[index].name ?? '',
                                          fontSize: 16.sp,
                                          color: MyColor.titleTextColor,
                                          overflow: TextOverflow.ellipsis,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                        MyText(
                                          text: gCharacterDetailModal.passiveTalents?[index].unlock ?? '',
                                          fontSize: 14.sp,
                                          color: MyColor.subtitleTextColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              MyText(
                                text: gCharacterDetailModal.passiveTalents?[index].description ?? '',
                                fontSize: 14.sp,
                                color: MyColor.subtitleTextColor,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                            ],
                          );
                        }),
                MyDivider(),
                gCharacterDetailModal.constellations == null
                    ? Container()
                    : ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: gCharacterDetailModal.constellations?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CircleAvatar(
                                        backgroundColor: MyColor.amberColor,
                                        backgroundImage: NetworkImage('${MyImage.characterImage}$name/constellation-${index + 1}'),
                                        radius: 40.r),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      children: [
                                        MyText(
                                          text: gCharacterDetailModal.constellations?[index].name ?? '',
                                          fontSize: 16.sp,
                                          color: MyColor.titleTextColor,
                                          overflow: TextOverflow.ellipsis,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                        MyText(
                                          text: gCharacterDetailModal.constellations?[index].unlock ?? '',
                                          fontSize: 14.sp,
                                          color: MyColor.subtitleTextColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              MyText(
                                text: gCharacterDetailModal.constellations?[index].description ?? '',
                                fontSize: 14.sp,
                                color: MyColor.subtitleTextColor,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.h),
                            ],
                          );
                        })
              ],
            ),
          )
        ],
      ),
    );
  }

  String formatDate(String dateStr) {
    List<String> dateParts = dateStr.split('-');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);
    DateTime date = DateTime(year, month, day);
    String formattedDay = DateFormat('dd').format(date);
    String formattedMonth = DateFormat('MMMM').format(date);
    String suffix = _getDaySuffix(int.parse(formattedDay));
    return '$formattedMonth $formattedDay$suffix';
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
