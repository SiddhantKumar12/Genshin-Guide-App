import 'package:dainsleif_journal/Utils/color.dart';
import 'package:dainsleif_journal/cubit/food_detail_cubit/food_detail_cubit.dart';
import 'package:dainsleif_journal/repositiory/api_service/api_strings.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:dainsleif_journal/screen/widget/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailScreen extends StatelessWidget {
  final String name;

  const FoodDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FoodDetailCubit(name),
        child: BlocBuilder<FoodDetailCubit, FoodDetailState>(
          builder: (context, state) {
            if (state is FoodDetailLoaded) {
              return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network('${ApiStrings.baseUrl}${ApiStrings.foodName}${name}'),
                          MyText(
                            text: index.toString(),
                            color: MyColor.violetColor,
                          ),
                        ],
                      ),
                    );
                  });
            }
            if (state is FoodDetailLoading) {
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
