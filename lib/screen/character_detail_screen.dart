import 'package:dainsleif_journal/cubit/g_character_detail_cubit/g_character_detail_cubit.dart';
import 'package:dainsleif_journal/screen/widget/G_character_detail_widget.dart';
import 'package:dainsleif_journal/screen/widget/custom_app_bar.dart';
import 'package:dainsleif_journal/screen/widget/error.dart';
import 'package:dainsleif_journal/screen/widget/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GCharacterDetailScreen extends StatelessWidget {
  final String name;
  const GCharacterDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: name.toUpperCase(),
      ),
      body: BlocProvider(
        create: (context) => GCharacterDetailCubit(name),
        child: BlocBuilder<GCharacterDetailCubit, GCharacterDetailState>(
          builder: (context, state) {
            if (state is GCharacterDetailLoaded) {
              return GCharacterDetailWidget(
                gCharacterDetailModal: state.gCharacterDetailModal,
                name: name ?? '',
              );
            } else if (state is GCharacterDetailError) {
              return const MyError();
            } else {
              return MyLoader();
            }
          },
        ),
      ),
    );
  }
}
