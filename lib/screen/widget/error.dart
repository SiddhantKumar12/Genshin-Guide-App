import 'package:dainsleif_journal/Utils/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyError extends StatelessWidget {
  const MyError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      MyImage.paimonSleeping,
    ));
  }
}
