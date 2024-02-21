import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/cubit/artifact_detail_cubit/artifact_detail_cubit.dart';
import 'package:dainsleif_journal/cubit/nation_detail_cubit/nation_detail_cubit.dart';
import 'package:dainsleif_journal/repositiory/api_service/api_strings.dart';
import 'package:dainsleif_journal/screen/widget/cache_image_widget.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/image.dart';

class ArtifactDetailScreen extends StatelessWidget {
  final String name;

  const ArtifactDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
        child: BlocProvider(
          create: (context) => ArtifactDetailCubit(name),
          child: BlocBuilder<ArtifactDetailCubit, ArtifactDetailState>(
            builder: (context, state) {
              if (state is ArtifactDetailLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              MyImage.bg,
                              height: 400.h,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            child: CacheImageWidget(
                              imageUrl: '${ApiStrings.baseUrl}${ApiStrings.artifacts}$name/circlet-of-logos',
                              height: 400.h,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyText(
                      text: state.artifactDetailModal.name ?? '',
                      color: MyColor.violetColor,
                    ),
                    MyText(
                      text: state.artifactDetailModal.maxRarity.toString() ?? '',
                      color: MyColor.violetColor,
                    ),
                    MyText(
                      text: state.artifactDetailModal.s2PieceBonus ?? '',
                      color: MyColor.violetColor,
                    ),
                    MyText(
                      text: state.artifactDetailModal.s4PieceBonus ?? '',
                      color: MyColor.violetColor,
                    ),
                  ],
                );
              }
              if (state is ArtifactDetailLoading) {
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
