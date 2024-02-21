import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/cubit/nation_detail_cubit/nation_detail_cubit.dart';
import 'package:dainsleif_journal/repositiory/api_service/api_strings.dart';
import 'package:dainsleif_journal/screen/widget/custom_app_bar.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NationDetailScreen extends StatelessWidget {
  final String name;

  const NationDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: ''),
      body: BlocProvider(
        create: (context) => NationDetailCubit(name),
        child: BlocBuilder<NationDetailCubit, NationDetailState>(
          builder: (context, state) {
            if (state is NationDetailLoaded) {
              return Center(
                child: Column(
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
                      child: ClipRRect(
                        child: Image.network(
                          '${ApiStrings.baseUrl}${ApiStrings.nations}$name/icon',
                          height: 400.h,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyText(text: 'Region : '),
                        MyText(text: state.nationModal.name ?? ''),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyText(text: 'Element : '),
                        MyText(text: state.nationModal.element ?? ''),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyText(text: 'Archon : '),
                        MyText(text: state.nationModal.archon ?? ''),
                      ],
                    ),
                  ],
                ),
              );
            }
            if (state is NationDetailLoading) {
              return MyLoader();
            } else {
              return MyError();
            }
          },
        ),
      ),
    );
  }
}
