import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/cubit/enemies_detail/enemies_cubit.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnemiesDetailScreen extends StatelessWidget {
  final String name;

  const EnemiesDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: BlocProvider(
            create: (context) => EnemiesCubit(name),
            child: BlocBuilder<EnemiesCubit, EnemiesState>(
              builder: (context, state) {
                if (state is EnemiesLoaded) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyText(
                          text: state.enemiesModal.name ?? '',
                          color: MyColor.violetColor,
                        ),
                        MyText(
                          text: state.enemiesModal.description ?? '',
                          color: MyColor.violetColor,
                        ),
                        MyText(
                          text: state.enemiesModal.region ?? '',
                          color: MyColor.violetColor,
                        ),
                        MyText(
                          text: state.enemiesModal.family ?? '',
                          color: MyColor.violetColor,
                        ),
                      ],
                    ),
                  );
                }
                if (state is EnemiesLoading) {
                  return MyLoader();
                } else {
                  return MyError();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
