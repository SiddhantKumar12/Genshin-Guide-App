import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/cubit/artifact_detail_cubit/artifact_detail_cubit.dart';
import 'package:dainsleif_journal/cubit/domain_detail/domain_detail_cubit.dart';
import 'package:dainsleif_journal/cubit/element_detail_cubit/element_detail_cubit.dart';
import 'package:dainsleif_journal/cubit/nation_detail_cubit/nation_detail_cubit.dart';
import 'package:dainsleif_journal/repositiory/api_service/api_strings.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DomainDetailScreen extends StatelessWidget {
  final String name;

  const DomainDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DomainDetailCubit(name),
        child: BlocBuilder<DomainDetailCubit, DomainDetailState>(
          builder: (context, state) {
            if (state is DomainDetailLoaded) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('${ApiStrings.baseUrl}${ApiStrings.elements}$name/icon'),
                    MyText(
                      text: state.domainModal.name ?? '',
                      color: MyColor.violetColor,
                    ),
                    // MyText(
                    //   text: state.elementModal.key.toString() ?? '',
                    //   color: MyColor.violetColor,
                    // ),
                    // MyText(
                    //   text: state.elementModal.reactions?.first.toString() ?? '',
                    //   color: MyColor.violetColor,
                    // ),
                  ],
                ),
              );
            }
            if (state is DomainDetailLoading) {
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
