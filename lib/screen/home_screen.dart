import 'dart:math';
import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/Utils/image.dart';
import 'package:dainsleif_journal/screen/widget/custom_app_bar.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../cubit/genshin_cubit/g_cubit.dart';
import 'data_screen.dart';

class HomeScreen extends StatelessWidget {
  final rnd = Random();
  // late List<int> extents;
  List<int> values = [1, 2, 3];

  List<String> imageList = [
    MyImage.artifactImage,
    MyImage.bossImage,
    MyImage.characterLocalImage,
    MyImage.foodImage,
    MyImage.domainImage,
    MyImage.elementImage,
    MyImage.bossImage,
    MyImage.materialImage,
    MyImage.nationImage,
    MyImage.weaponImage,
  ];
  @override
  Widget build(BuildContext context) {
    // extents = List<int>.generate(100, (int index) => rnd.nextInt(13) + 1);
    return Scaffold(
      appBar: CustomAppBar(text: 'DainsLeif Journal', notBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: BlocProvider(
          create: (context) => GCubit(),
          child: BlocBuilder<GCubit, GState>(
            builder: (context, state) {
              if (state is GLoaded) {
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  itemBuilder: (context, index) {
                    int randomIndex = rnd.nextInt(values.length);
                    final double height = values[randomIndex] * 170.h;
                    return index == 1 || index == 4 || index == 7
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => DataScreen(item: state.genshinModal.types?[index] ?? '')));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: MyColor.turcoiseColor, width: 3.sp),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  height: height,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.r),
                                    child: Image.asset(
                                      imageList[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    gradient: LinearGradient(
                                      colors: [
                                        MyColor.whiteColor.withOpacity(0.3),
                                        MyColor.blackColor,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    color: MyColor.blackColor.withOpacity(0.3),
                                  ),
                                  height: height,
                                  width: double.maxFinite,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: MyText(
                                      color: MyColor.whiteColor,
                                      text: state.genshinModal.types?[index].toUpperCase() ?? '',
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                  itemCount: state.genshinModal.types?.length,
                );
              }
              if (state is GError) {
                return MyError();
              } else {
                return MyLoader();
              }
            },
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }
}
