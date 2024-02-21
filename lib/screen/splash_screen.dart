import 'dart:ui';

import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/Utils/image.dart';
import 'package:dainsleif_journal/cubit/splash_cubit/progress_bar_cubit.dart';
import 'package:dainsleif_journal/screen/widget/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/splash_cubit.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state == SplashState.loaded) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      MyImage.irminsulImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.2), // Adjust the opacity as needed
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              MyImage.genshinImpact,
                              alignment: Alignment.center,
                            ),
                            Image.asset(
                              MyImage.primoGems,
                              height: 200.h,
                              width: 200.w,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 20.h),
                            BlocProvider(
                              create: (context) => ProgressCubit(durationInSeconds: 3),
                              child: BlocBuilder<ProgressCubit, double>(
                                builder: (context, state) {
                                  return SizedBox(
                                    width: 300.w,
                                    child: FAProgressBar(
                                      progressGradient: LinearGradient(
                                        colors: [
                                          Colors.blue.shade50,
                                          Colors.blue.shade100,
                                          Colors.blue.shade200,
                                          Colors.blue.shade300,
                                          Colors.blue.shade400,
                                          Colors.blue.shade500,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      backgroundColor: Colors.pink.shade100,
                                      currentValue: (state * 100).toDouble(),
                                      maxValue: 100,
                                      direction: Axis.horizontal,
                                      borderRadius: BorderRadius.circular(10.r),
                                      size: 15.w,
                                      animatedDuration: Duration(milliseconds: state.toInt()),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
